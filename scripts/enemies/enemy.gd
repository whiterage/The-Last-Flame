extends CharacterBody2D

@export var damage := 20.0
@export var knockback := 300.0

@onready var damage_area = $damage

func _on_damage_body_entered(body: Node2D) -> void:
	# Проверка, что это Player
	if body.is_in_group("player"):
		# Наносим урон (уменьшаем пламя)
		body.flame -= damage
		
		# Отбрасываем игрока — только если он CharacterBody2D
		if body.has_method("apply_knockback"):
			var dir = sign(body.position.x - position.x)
			body.apply_knockback(dir * knockback)

func kill():
	queue_free()  # враг исчезает
