extends Node2D

export var amount = 4500
var boxes = []

func _ready() -> void:
	for i in amount:
		var n = Box.new()
		boxes.append(n)
	print(amount)

func _draw() -> void:
	for n in boxes:
		draw_rect(Rect2(n.x, n.y, n.s, n.s), n.c)
		n._update()

func _process(delta: float) -> void:
	update()

class Box:
	var x:float
	var y:float
	var vx:float
	var vy:float
	var s:int
	var c:Color

	func _init() -> void:
		x = randi()%750
		y = randi()%550
		vx = randi()%10+1
		vy = randi()%10+1
		s = randi()%50+1
		c = Color8(s*4,s*4,s*4)

	func _update() -> void:
		x = x + (vx*(55-s))/100
		if x>(800-s) or x<0: vx = -vx
		y = y + (vy*(55-s))/100
		if y>(600-s) or y<0: vy = -vy
