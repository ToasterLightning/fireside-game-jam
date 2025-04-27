extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	#Get input direction
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction += Vector2.UP
	if Input.is_action_pressed("left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("down"):
		direction += Vector2.DOWN
		
	#Design choice whether or not to make diagnoals faster
	#direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
