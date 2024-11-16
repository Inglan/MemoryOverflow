extends CharacterBody2D


@export var SPEED = 690
@export var JUMP_VELOCITY = -690

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var landing = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		landing = true
	if is_on_floor():
		if landing:
			$Land.play()
			landing = false
	# Handle Jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		$Jump.play()
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("down") and not is_on_floor():
		$Down.play()
		velocity.y = -JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
