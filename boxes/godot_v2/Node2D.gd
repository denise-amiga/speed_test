extends Node2D

export var amount = 5700

func _ready() -> void:
	for b in amount:
		add_child(myColorRect.new())
