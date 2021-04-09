extends Node2D

export var amount = 5000

func _ready() -> void:
	for b in amount:
		add_child(myColorRect.new())
