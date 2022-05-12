extends KinematicBody2D

var motion = Vector2(0, 0)
var up = Vector2(0, -1)
const SPEED = 400
const JUMPSPEED = 2000
const GRAVITY = 150

var countjump = 0


func _physics_process(_delta):
	
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	else:
		motion.x = 0
	if Input.is_action_pressed("ui_down"):
		motion.x = 0
		
	move_and_slide(motion, up)
	animate()
	apply_gravity()
		
		
func apply_gravity():
	if is_on_floor():
		motion.y = 0
		countjump = 0
	else:
		motion.y += GRAVITY
		
		
	if Input.is_action_just_pressed("ui_up") && countjump <2:
		motion.y = -JUMPSPEED
		countjump += 1
		
		





func animate():
	if motion.x >0:
		$AnimatedSprite.play("Caminar")
		$AnimatedSprite.flip_h = false
	elif motion.x <0:
		$AnimatedSprite.play("Caminar")
		$AnimatedSprite.flip_h = true
	elif motion.y <0:
		$AnimatedSprite.play("Salto Comun")
	else:
		$AnimatedSprite.play("Idle")
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("Daño")



