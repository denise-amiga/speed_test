extends Label

func _draw() -> void:
	text = str(Performance.get_monitor(Performance.TIME_FPS))

func _process(delta: float) -> void:
	update()
