extends Node2D

var ram = 10
var ramusage = 0
var fading = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
