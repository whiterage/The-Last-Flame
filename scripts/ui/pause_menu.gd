extends Control

func _ready():
	visible = false  # Изначально скрыт

func open():
	visible = true
	get_tree().paused = true

func close():
	visible = false
	get_tree().paused = false
