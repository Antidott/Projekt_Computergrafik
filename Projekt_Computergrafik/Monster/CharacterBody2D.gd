extends CharacterBody2D


const speed = 100.0
@onready var targetPlayer = $/root/World/Player/CharacterBody2D

func _physics_process(delta):
	var direction = (targetPlayer.global_position - global_position).normalized()
	velocity = direction * speed
	look_at(direction)
	move_and_slide()
