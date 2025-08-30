extends CharacterBody2D

@export var speed = 100.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var gravity = 980.0

@export var jump_velocity = -270.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = Input.get_axis("left", "right")

	if direction:
		if direction > 0:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("run")
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		animated_sprite_2d.play("default")

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_velocity

	move_and_slide()
