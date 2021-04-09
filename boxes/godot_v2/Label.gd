extends Label

func _process(delta: float) -> void:
	text = str(Performance.get_monitor(Performance.TIME_FPS))
