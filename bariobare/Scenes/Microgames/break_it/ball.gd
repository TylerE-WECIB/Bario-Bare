extends RigidBody2D

var ball_type := "ball"
var collided_already := false

func _on_body_entered(body: RigidBody2D):
	if ball_type == "cue" and not collided_already:
		collided_already = true
