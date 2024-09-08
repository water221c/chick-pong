extends Node2D

var food = preload("res://food.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Chick.start()
	$Timer.wait_time = randf_range(1, 2.5)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()



func _on_timer_timeout() -> void:
	var f = food.instantiate()
	f.position = Vector2(randf_range(300, 1620), randf_range(300, 780))
	var i = randf_range(0.2, 10)
	f.scale = Vector2(i, i)
	add_child(f)
	$Timer.wait_time = randf_range(2, 4)
	$Timer.start()
