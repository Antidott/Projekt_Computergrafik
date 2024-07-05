extends CharacterBody2D


const speed = 100.0
var ignorePlayerHunt = false
var goAwayPoint = null
@onready var targetPlayer = $/root/World/Player/CharacterBody2D
@onready var targetFire = $/root/World/FireList

func _physics_process(delta):
	var rng = RandomNumberGenerator.new()
	for fire in targetFire.get_children():
		if targetPlayer.global_position.distance_to(fire.global_position) < 100:#stop hunting if palyer is in fire range
			return
		var distanceToFire = global_position.distance_to(fire.global_position)
		if ignorePlayerHunt and distanceToFire < 190:#go away if to close on fire
			if(goAwayPoint == null):
				var direction = -(fire.global_position - global_position).normalized()
				goAwayPoint = direction;
				velocity = direction * speed
			look_at(goAwayPoint)
			move_and_slide()
			return
		if distanceToFire < 120:
			ignorePlayerHunt = true
			return
	ignorePlayerHunt = false
	goAwayPoint = null
	var direction = (targetPlayer.global_position - global_position).normalized()
	velocity = direction * speed
	look_at(direction)
	move_and_slide()
