extends CharacterBody2D


const SPEED = 300.0
const TURN_RATE = 3.0

func _physics_process(delta: float) -> void:
	#Get input direction
	var direction = Vector2.ZERO
	var moving = 0
	if Input.is_action_pressed("right"):
		direction.x += 1 
		moving = 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
		moving = 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
		moving = 1
	if Input.is_action_pressed("down"):
		direction.y += 1
		moving = 1
	print(direction)
	if moving:
		rotation = lerp_angle(rotation, direction.angle() + PI/2, TURN_RATE*delta)
	velocity = moving * SPEED * Vector2(sin(rotation),-cos(rotation))
	move_and_slide()
	transform.y = 1.5*moving
