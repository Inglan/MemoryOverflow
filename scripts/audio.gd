extends AudioStreamPlayer

func _ready():
	$".".play()

func _process(_delta):
	if not $".".playing:
		$".".play()
