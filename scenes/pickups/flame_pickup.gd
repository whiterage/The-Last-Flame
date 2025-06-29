extends Area2D

@export var flame_amount: float = 20.0


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.flame += flame_amount
		body.flame = clamp(body.flame, 0, 100)
		queue_free()
