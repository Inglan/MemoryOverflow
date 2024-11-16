extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.position[1]>2000:
		$Player.position = Vector2(-50, 150)
		$Player.velocity.y = 0
