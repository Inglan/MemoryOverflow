extends Sprite2D

func enter(_area):
	queue_free()
	ramcounter.rambytes = 	ramcounter.rambytes + 10000
