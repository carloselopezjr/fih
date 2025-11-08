extends CharacterBody2D
@export var speed: float = 130.0 # can also just use := like var speed := 130
@onready var anim:= $AnimatedSprite2D
var direction := Vector2.ZERO # null direction by default
var last_facing := "down" # facing down by default

# Runs every frame that's tied to physics with respect to movement
func _physics_process(_delta):
	# Get movement input
	direction = Vector2(
		Input.get_action_strength("move_right") - 
		Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		).normalized()
		
		# Apply velocity
	velocity = direction * speed
	move_and_slide()
		
	# Update animation
	_update_anim()

func _update_anim():
	if direction.length() > 0:
		# Decide facing direction
		if abs(direction.x) > abs(direction.y):
			last_facing = "right" if direction.x > 0 else "left"
		else:
			last_facing = "down" if direction.y > 0 else "up"
		anim.play("walk_%s" % last_facing)
	else:
		anim.play("walk_%s" % last_facing)
