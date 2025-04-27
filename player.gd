extends CharacterBody2D


const SPEED = 300.0
const TURN_RATE = 5.0

func _physics_process(delta: float) -> void:
	#Get input direction
	var mov_direction = 0
	var turn_direction = 0
	
	if Input.is_action_pressed("right"):
		if not Input.is_action_pressed("left"):
			turn_direction = 1
	elif Input.is_action_pressed("left"):
		turn_direction = -1
	elif Input.is_action_pressed("up"):
		if not Input.is_action_pressed("down"):
			mov_direction = 1
	elif Input.is_action_pressed("down"):
		mov_direction = -1
	
	
	rotate(TURN_RATE * turn_direction * delta)
	velocity = mov_direction * SPEED * Vector2(sin(rotation),-cos(rotation))
	move_and_slide()
