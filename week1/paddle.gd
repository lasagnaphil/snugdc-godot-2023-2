extends AnimatableBody2D

enum PlayerType { P1, P2 }

@export var player_type: PlayerType
@export var move_speed = 500

func _physics_process(delta):
	var move_dir = 0
	if player_type == PlayerType.P1:
		if Input.is_action_pressed("player1_down"):
			move_dir = 1
		elif Input.is_action_pressed("player1_up"):
			move_dir = -1
			
	elif player_type == PlayerType.P2:
		if Input.is_action_pressed("player2_down"):
			move_dir = 1
		elif Input.is_action_pressed("player2_up"):
			move_dir = -1
			
	var screen_size = get_viewport_rect().size
	var paddle_size = $Sprite2D.get_rect().size
	position.y = clamp(position.y + move_dir * move_speed * delta,
		paddle_size.y / 2,
		screen_size.y - paddle_size.y / 2)
