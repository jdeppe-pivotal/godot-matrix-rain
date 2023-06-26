extends Node

class_name RainColumn


const characters = "01234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^&*()_+-=`{}[]:;'<>?,./|\'"

var sprites = {}
var timer : Timer = null
var random = RandomNumberGenerator.new()
var template : PackedScene = load("res://src/matrix_char.tscn")
var column_x : int
var column_y : int = 0
const y_step : int = 42


func _init(x : int):
	column_x = x

func _ready():
	create_random_letter()

	timer = Timer.new()
	timer.timeout.connect(create_random_letter)
	timer.set_wait_time(0.2)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.start()


func create_random_letter():
	var letter = template.instantiate()
	var i = random.randi_range(0, characters.length() - 1)
	letter.init(characters[i])
	letter.position.x = column_x
	letter.position.y = column_y
	add_child(letter)
	column_y += y_step
#	print(characters[i])

	var screen_height = get_tree().get_root().size.y
	if column_y >= screen_height:
		timer.stop()
		var delete_me_timer = Timer.new()
		delete_me_timer.timeout.connect(queue_free)
		delete_me_timer.set_wait_time(5)
		delete_me_timer.set_one_shot(true)
		add_child(delete_me_timer)
		delete_me_timer.start()
