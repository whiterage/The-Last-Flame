extends PointLight2D

func _process(delta):
	var pulse = 0.7 + sin(Time.get_ticks_msec() / 200.0) * 0.3
	energy = pulse
