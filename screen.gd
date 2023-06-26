extends Node2D

var timer : Timer = null
var random = RandomNumberGenerator.new()
const column_width : int = 40


func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	
func ready():	
	timer = Timer.new()
	add_child(timer)
	var _callable = Callable(self, "create_random_rain_column")
	timer.connect("timeout", _callable)
	timer.set_wait_time(0.05)
	timer.set_one_shot(false)
	timer.start()

func create_random_rain_column():
	var screen_width = get_tree().get_root().size.x
	var columns = screen_width / column_width
	var column = random.randi_range(0, columns - 1)
	
	add_child(RainColumn.new(column * column_width))
