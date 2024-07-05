extends CharacterBody2D

@export var speed = 150
@onready var targetPlayer = $/root/World/Player/CharacterBody2D

# Declare variables
var is_alive: bool = true
var target = position
var is_button_clicked = false

func _ready():
	# Ensure the player is alive at the start
	is_alive = true
	# Connect the area2d body_entered signal to the player script

# Function to check for collision with enemy
func _on_Area2D_body_entered(body):
	if body != targetPlayer:
		die()

# Function to handle player's death
func die():
	is_alive = false
	# Disable player movement or other actions
	set_process(false)
	# Show the game over screen
	call_deferred("show_game_over_screen")

# Function to show the game over screen
func show_game_over_screen():
	get_tree().change_scene_to_file("res://GameOver.tscn")

func _input(event):
	if event.is_class("InputEventMouseMotion") and is_button_clicked:
		target = get_global_mouse_position()
	if event.is_class("InputEventMouseButton"):
		if event.is_pressed():
			is_button_clicked = true
			target = get_global_mouse_position()
		if !event.is_pressed():
			is_button_clicked = false

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()
