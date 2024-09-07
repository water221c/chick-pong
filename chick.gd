extends CharacterBody2D

var speed = 1000
var mult = 2.5

func start():
	rotation = randf_range(1, 360)
	velocity = Vector2(speed, 0).rotated(rotation)
	scale *= mult

func _physics_process(delta):
	scale = Vector2(mult, mult)
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
	mult -= 0.5 * delta
