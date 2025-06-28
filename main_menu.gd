extends Control


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/test_level.tscn") # Replace with function body.


func _on_options_pressed() -> void:
	print("Options menu not implemented yet!") # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.
