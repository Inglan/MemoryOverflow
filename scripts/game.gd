extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.position[1]>1000:
		$Player.velocity.y += $Player.gravity * delta * 5
	if $Player.position[1]>3000:
		$Player.position = Vector2(-50, -1000)
		$Player.velocity.y = 0
