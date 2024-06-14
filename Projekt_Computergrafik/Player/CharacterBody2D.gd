extends CharacterBody2D

@export var speed = 150

var target = position
var is_button_clicked = false

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
