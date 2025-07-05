extends CharacterBody2D


const JUMP_VELOCITY = -120.0
var gravity = Vector2i(0,0)
var start = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		start = true
		velocity.y = JUMP_VELOCITY
		
	if start :
		gravity = Vector2i(0,200)
		$AnimatedSprite2D.play("fly")

	move_and_slide()
	
func bird():
	pass
