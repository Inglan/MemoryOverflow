extends AudioStreamPlayer

func _ready():
	self.play()

func _process(_delta):
	if not self.playing:
		self.play()
