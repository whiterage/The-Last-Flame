extends Control

@onready var start_btn = $"VBoxContainer/start_game"
@onready var options_btn = $"VBoxContainer/options"
@onready var exit_btn = $"VBoxContainer/exit"
@onready var fire_particles = $"VBoxContainer/start_game/FireParticles"
@onready var fire_particles2 = $"VBoxContainer/start_game/FireParticles2"
@onready var fire_particles3 = $"VBoxContainer/options/FireParticles3"
@onready var fire_particles4 = $"VBoxContainer/options/FireParticles4"
@onready var fire_particles5 = $"VBoxContainer/exit/FireParticles5"
@onready var fire_particles6 = $"VBoxContainer/exit/FireParticles6"

# Общий Tween
var tween

func _ready():
	tween = create_tween()
	fire_particles.emitting = false
	fire_particles2.emitting = false
	fire_particles3.emitting = false
	fire_particles4.emitting = false
	fire_particles5.emitting = false
	fire_particles6.emitting = false

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/test_level.tscn")

func _on_options_pressed():
	print("Options menu not implemented yet!")

func _on_exit_pressed():
	get_tree().quit()

# === Наведение Start ===
func _on_start_game_mouse_entered():
	tween.kill()
	tween = create_tween()
	tween.tween_property(start_btn, "scale", Vector2(1.05, 1.05), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	fire_particles.emitting = true
	fire_particles2.emitting = true

func _on_start_game_mouse_exited():
	tween.kill()
	tween = create_tween()
	tween.tween_property(start_btn, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	fire_particles.emitting = false
	fire_particles2.emitting = false

# === Наведение Options ===
func _on_options_mouse_entered():
	tween.kill()
	tween = create_tween()
	tween.tween_property(options_btn, "scale", Vector2(1.05, 1.05), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	fire_particles3.emitting = true
	fire_particles4.emitting = true

func _on_options_mouse_exited():
	tween.kill()
	tween = create_tween()
	tween.tween_property(options_btn, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	fire_particles3.emitting = false
	fire_particles4.emitting = false

# === Наведение Exit ===
func _on_exit_mouse_entered():
	tween.kill()
	tween = create_tween()
	tween.tween_property(exit_btn, "scale", Vector2(1.05, 1.05), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	fire_particles5.emitting = true
	fire_particles6.emitting = true

func _on_exit_mouse_exited():
	tween.kill()
	tween = create_tween()
	tween.tween_property(exit_btn, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	fire_particles5.emitting = false
	fire_particles6.emitting = false
