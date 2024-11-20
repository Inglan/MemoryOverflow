extends Control

var sliderhovered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		$"Sound/navigation_backward-selection-minimal".play()
		$Camera2D.position.y = $Title.position.y
		$Camera2D.position.x = $Title.position.x
		
	# not sus
	if Input.is_action_just_pressed("middlemouse") and sliderhovered:
		$Title/VBoxContainer/HBoxContainer2/HSlider.value = 100
		$Title/VBoxContainer/HBoxContainer2/Label.text = str(100000000000) + "%"
		backgroundmusic.volume_db = linear_to_db(100000000000/100)
		
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
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func showlicences():
	$"Sound/navigation_forward-selection-minimal".play()
	$Camera2D.position.y = $Licences.position.y
	$Camera2D.position.x = $Licences.position.x


func tabchanged(tab):
	$"Sound/navigation_forward-selection-minimal".play()


func volumechanged(value):
	$Title/VBoxContainer/HBoxContainer2/Label.text = str(value) + "%"
	backgroundmusic.volume_db = linear_to_db(value/100)


func sliderhover():
	sliderhovered = true


func sliderunhover():
	sliderhovered = false
