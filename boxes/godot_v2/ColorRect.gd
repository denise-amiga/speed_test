extends ColorRect
class_name myColorRect

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

func _ready() -> void:
	set_position(Vector2(x,y))
	set_size(Vector2(s,s))
	color = c

func _process(delta: float) -> void:
	x = x + (vx*(55-s))/100
	if x>(800-s) or x<0: vx = -vx
	y = y + (vy*(55-s))/100
	if y>(600-s) or y<0: vy = -vy
	set_position(Vector2(x,y))
