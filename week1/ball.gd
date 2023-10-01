extends RigidBody2D

@export var move_speed: int

func _ready():
	reset_ball()
	
func reset_ball():
	position = get_viewport_rect().size / 2
	var angle = randf_range(-0.2 * PI, 0.2 * PI)
	if randf() < 0.5:
		angle += PI
	linear_velocity = Vector2(move_speed, 0).rotated(angle)

func _integrate_forces(state):
	state.angular_velocity = 0
