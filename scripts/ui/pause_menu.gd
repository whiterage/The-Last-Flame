extends Control

@onready var continue_btn = $"VBoxContainer/Continue"
@onready var main_menu_btn = $"VBoxContainer/Main_menu"

var tween

func _ready():
	tween = create_tween()
	visible = false

func _on_continue_pressed():
	get_tree().paused = false
	visible = false

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")


func _on_continue_mouse_entered() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property(continue_btn, "scale", Vector2(1.05, 1.05), 0.15) # Replace with function body.


func _on_continue_mouse_exited() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property(continue_btn, "scale", Vector2(1, 1), 0.15) # Replace with function body.


func _on_main_menu_mouse_entered() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property(main_menu_btn, "scale", Vector2(1.05, 1.05), 0.15) # Replace with function body.


func _on_main_menu_mouse_exited() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property(main_menu_btn, "scale", Vector2(1, 1), 0.15) # Replace with function body.
