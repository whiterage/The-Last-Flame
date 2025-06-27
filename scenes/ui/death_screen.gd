extends Control  # или CanvasLayer, смотря что у тебя

func _on_button_pressed():
	get_tree().reload_current_scene()
