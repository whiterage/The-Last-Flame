extends CharacterBody2D

const SPEED := 200
const JUMP_VELOCITY := -400
const GRAVITY := 900

# 🔥 Пламя
var flame := 100.0  # от 100 до 0
var hud

@onready var flame_light: Light2D = $FlameLight
@onready var death_screen = get_parent().get_node("DeathScreen")

func _ready():
	# Найдём HUD — путь зависит от твоей сцены!
	# Если HUD в корне уровня:
	hud = get_parent().get_node("HUD")

func _physics_process(delta):
	# Гравитация
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Движение влево/вправо
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED

	# Прыжок
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()

	# 🔻 Постепенное угасание
	flame -= delta * 5
	flame = clamp(flame, 0, 100)

	update_light()

	# 💀 Проверка на смерть
	if flame <= 0.0:
		die()

	# 🔻 Обновляем HUD
	if hud:
		hud.update_flame(flame)

func update_light():
	# Масштабируем яркость света от пламени (делим на 100, если energy от 0 до 1)
	flame_light.energy = flame / 100.0

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func die():
	print("🔥 Герой угас...")
	death_screen.visible = true  # показываем экран смерти
	queue_free()  # уничтожаем игрока

	# Показываем надпись, если Label есть
	var label_path = "TestLevel/CanvasLayer/Label"
	if get_tree().get_root().has_node(label_path):
		var label = get_tree().get_root().get_node(label_path)
		label.text = "🔥 Герой угас..."
		label.visible = true

	# Удаляем игрока
	queue_free()
