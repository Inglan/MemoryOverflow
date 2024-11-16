extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func back():
	$"Sound/navigation_backward-selection-minimal".play()
	$Camera2D.position.y = $Title.position.y
	$Camera2D.position.x = $Title.position.x

func showcredits():
	$"Sound/navigation_forward-selection-minimal".play()
	$Camera2D.position.y = $Credits.position.y
	$Camera2D.position.x = $Credits.position.x

func showhowto():
	$"Sound/navigation_forward-selection-minimal".play()
	$Camera2D.position.y = $HowTo.position.y
	$Camera2D.position.x = $HowTo.position.x

func play():
	$Camera2D.position.y = -$HowTo.position.y
	await get_tree().create_timer(0.1).timeout
	$CanvasLayer/ColorRect/AnimationPlayer.play("fadeincolor")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func animationfinished(anim_name):
	pass # Replace with function body.
