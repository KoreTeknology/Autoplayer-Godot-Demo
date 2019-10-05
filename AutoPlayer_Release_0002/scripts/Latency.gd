extends Label

# var b: String = "text"
var timer
# Called when the node enters the scene tree for the first time.


func _ready():
	#print (Performance.get_monitor(27))
	
	timer = Timer.new()
	timer.set_wait_time(0.5)
	timer.connect("timeout",self,"_on_Timer_timeout") 
	#timeout is what says in docs, in signals
	#self is who respond to the callback
	#_on_timer_timeout is the callback, can have any name
	add_child(timer) #to process
	timer.start() #to start
	

func _on_Timer_timeout() -> void:
	self.text = str(stepify(Performance.get_monitor(27),0.001))
	