extends PointLight2D

var tween

func _ready():
	_flicker()

func _flicker():
	tween = create_tween()
	var new_energy = randf_range(0.6, 1.4)
	tween.tween_property(self, "energy", new_energy, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.chain().tween_callback(Callable(self, "_flicker"))
