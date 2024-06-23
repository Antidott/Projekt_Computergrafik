extends Label

var score: int = 0
var score_timer: Timer
var score_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	score_label = $ScoreLabel
	
	score_timer = Timer.new()
	score_timer.set_wait_time(1.0)
	score_timer.set_one_shot(false)
	score_timer.connect("timeout", self, "_on_score_timer_timeout")
	add_child(score_timer)
	score_timer.start()

func _on_score_timer_timeout():
	score += 1
	update_score_label()
	
func update_score_label():
	score_label.text = str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
