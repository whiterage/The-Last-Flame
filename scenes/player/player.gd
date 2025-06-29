extends CharacterBody2D

const SPEED := 200
const JUMP_VELOCITY := -400
const GRAVITY := 900

# 🔥 Пламя
var flame := 100.0
var hud

@onready var flame_light: Light2D = $FlameLight
@onready var death_screen = get_parent().get_node("DeathScreen")
@onready var attack_area = $AttackArea

func _ready():
	add_to_group("player") # важно!
	hud = get_parent().get_node("CanvasLayer/HUD")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()

	flame -= delta * 5
	flame = clamp(flame, 0, 100)

	update_light()

	if flame <= 0.0:
		die()

	if hud:
		hud.update_flame(flame)

	if Input.is_action_just_pressed("ui_attack"):
		attack()

func apply_knockback(force: float) -> void:
	velocity.x = force

func attack():
	print("ATTACK!")
	var bodies = attack_area.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("enemies"):
			body.kill()

func update_light():
	flame_light.energy = flame / 100.0

func die():
	print("🔥 Герой угас...")
	death_screen.visible = true
	queue_free()

	var label_path = "TestLevel/CanvasLayer/Label"
	if get_tree().get_root().has_node(label_path):
		var label = get_tree().get_root().get_node(label_path)
		label.text = "🔥 Герой угас..."
		label.visible = true
