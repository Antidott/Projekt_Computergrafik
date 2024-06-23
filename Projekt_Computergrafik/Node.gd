extends Node

# Declare variables
var score: int = 0
var score_timer: Timer

# Reference to the score label
@onready var score_label: Label = $ScoreLabel

# Called when the node enters the scene tree
func _ready():
	# Create and configure the timer
	score_timer = Timer.new()
	score_timer.wait_time = 1.0
	score_timer.one_shot = false
	score_timer.connect("timeout", Callable(self, "_on_score_timer_timeout"))
	add_child(score_timer)
	score_timer.start()

# Called every second by the timer
func _on_score_timer_timeout():
	score += 1
	update_score_label()

# Function to update the score label
func update_score_label():
	score_label.text = str(score)
