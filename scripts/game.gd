extends Node2D

var rambytes = float(10000)
var ramusagebytes = float(0)
var usagepercent = float(0)
var fading = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	usagepercent = ((float(ramusagebytes)/float(rambytes))*float(100))
	
	$CanvasLayer/VBoxContainer/HBoxContainer/Label2.text = str(ramusagebytes/1000) + "/" + str(rambytes/1000) + "MB"
	$CanvasLayer/VBoxContainer/ProgressBar.value = usagepercent
	
	if usagepercent > 90:
		$CanvasLayer/ScreenShake.material.set_shader_parameter("ShakeStrength", 0.2)
	else: 
		$CanvasLayer/ScreenShake.material.set_shader_parameter("ShakeStrength", 0)

	if RandomNumberGenerator.new().randi_range(0, 10) == 1:
		ramusagebytes = ramusagebytes + 10

	if $Player.position[1]>1000:
		$Player.velocity.y += $Player.gravity * delta * 5

		if not fading:
			fading = true
			$CanvasLayer/ColorRect/AnimationPlayer.play("fadeincolor")
		
	if $Player.position[1]>3000:
		$Player.position = Vector2(-50, -1000)
		$Player.velocity.y = 0
		fading = false
		$CanvasLayer/ColorRect/AnimationPlayer.play("fadeoutcolor")
	
	if Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		ramusagebytes = ramusagebytes + 50
		print(ramusagebytes)

	if Input.is_action_just_pressed("esc"):
		get_tree().paused=true
		$CanvasLayer/PauseMenu.visible = true


func resume():
	get_tree().paused=false
	$CanvasLayer/PauseMenu.visible = false


func exit():
	get_tree().change_scene_to_file("res://scenes/ui.tscn")
	get_tree().reload_current_scene()
