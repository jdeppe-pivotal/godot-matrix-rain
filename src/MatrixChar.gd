extends Sprite2D
class_name MatrixChar

@export var font : Font
@export var color : Color


var character : String
var animator : AnimationPlayer


func init(x : String):
	character = x


func _ready():
	animator = get_node("AnimationPlayer")
	animator.play("fade_out")
	pass


func _draw():
	draw_char(font, Vector2(0, 0), character, 48, color)

