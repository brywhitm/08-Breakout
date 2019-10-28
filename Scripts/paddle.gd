extends KinematicBody2D

const ball_scene = preload("res://Scenes/Ball.tscn")

var count=0

func _ready():
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	var y = get_position().y
	var mouse_x = get_viewport().get_mouse_position().x
	set_position(Vector2(mouse_x, y))

func _input(event):
	if event is InputEventKey and event.get_scancode()==KEY_SPACE:
		if count<=3:
			if event.is_pressed():
				count+=1
				var ball = ball_scene.instance()
				ball.set_position(get_position()-Vector2(0,26))
				get_tree().get_root().add_child(ball)