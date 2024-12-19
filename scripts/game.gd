extends Node2D

@export var RamCounter_Label : Label
@export var ProgressBarRam : ProgressBar
@export var ScreenShake : ColorRect
@export var Player : CharacterBody2D
@export var GameAnimationPlayer : AnimationPlayer
@export var PauseMenu : ColorRect

var fading = false

func _ready():
	ramcounter.rambytes = float(10000)
	ramcounter.ramusagebytes = float(0)
	ramcounter.usagepercent = float(0)

func _physics_process(delta: float) -> void:
	ramcounter.usagepercent = ((float(ramcounter.ramusagebytes)/float(ramcounter.rambytes))*float(100))
	
	RamCounter_Label.text = str(ramcounter.ramusagebytes/1000) + "/" + str(ramcounter.rambytes/1000) + "MB"
	ProgressBarRam.value = ramcounter.usagepercent
	
	if ramcounter.usagepercent > 90:
		ScreenShake.material.set_shader_parameter("ShakeStrength", 0.2)
	else: 
		ScreenShake.material.set_shader_parameter("ShakeStrength", 0)

	if RandomNumberGenerator.new().randi_range(0, 10) == 1:
		ramcounter.ramusagebytes = ramcounter.ramusagebytes + 10

	if Player.position[1]>1000:
		Player.velocity.y += Player.gravity * delta * 5

		if not fading:
			fading = true
			GameAnimationPlayer.play("fadeincolor")
		
	if Player.position[1]>3000:
		var y = Player.position[0]
		Player.position = Vector2(y-100, -50)
		Player.velocity.y = 0
		fading = false
		GameAnimationPlayer.play("fadeoutcolor")
	
	if Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		ramcounter.ramusagebytes = ramcounter.ramusagebytes + 40
		print(ramcounter.ramusagebytes)

	if Input.is_action_just_pressed("esc"):
		get_tree().paused=true
		PauseMenu.visible = true
	
	if ramcounter.usagepercent > 100:
		get_tree().quit()

func resume():
	get_tree().paused = false
	PauseMenu.visible = false


func exit():
	get_tree().change_scene_to_file("res://scenes/ui.tscn")
	get_tree().reload_current_scene()
