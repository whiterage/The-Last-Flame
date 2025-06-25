extends CharacterBody2D

const SPEED := 200
const JUMP_VELOCITY := -400
const GRAVITY := 900

# 🔥 Пламя
var flame := 1.0  # от 1.0 (ярко) до 0.0 (угас)

@onready var flame_light: Light2D = $FlameLight

func _ready():
	update_light()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()

	# 🔻 Постепенное угасание
	flame -= delta * 0.05  # уменьшается по чуть-чуть
	flame = clamp(flame, 0.0, 1.0)

	update_light()

	# 💀 Проверка на смерть
	if flame <= 0.0:
		die()

func update_light():
	# Масштабируем яркость света по значению пламени
	flame_light.energy = flame * 2.0  # можно экспериментировать

func die():
	print("🔥 Герой угас...")
	var label = get_tree().get_root().get_node("TestLevel/CanvasLayer/Label")
	label.text = "🔥 Герой угас..."
	label.visible = true
	queue_free()
