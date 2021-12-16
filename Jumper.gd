extends Area2D

signal captured

onready var trail = $eiwow/points

var velocity = Vector2(100,0)
var jump_speed = 1000
var target = null
var trail_length = 25

func _input(event):
	if target and event is InputEventScreenTouch and event.pressed:
		jump()
		
func jump():
	target.implode()
	target = null
	jump_speed += 100
	velocity = transform.x * jump_speed
	print(jump_speed)


func _on_Jumper_area_entered(area):
	target = area
	target.get_node("Pivot").rotation = (position - target.position).angle()
	velocity = Vector2.ZERO
	emit_signal("captured", area)

	
	
func _physics_process(delta):
	if trail.points.size() > trail_length:
		trail.remove_point(0)
	trail.add_point(position)
	if target:
		transform = target.orbit_position.global_transform
	else:
		position += velocity * delta


func _on_VisibilityNotifier2D2_screen_exited():
	get_tree().change_scene("res://menu.tscn")
	
