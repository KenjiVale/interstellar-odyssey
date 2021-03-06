extends Node2D


onready var orbit_position = $Pivot/Orbit

var radius = 100
var rotation_speed = PI
var muter = 1

func muterNambah(a):
	muter +=a
	
func init(_position, _radius=radius):
	position = _position
	radius = _radius
	$CollisionShape2D.shape = $CollisionShape2D.shape.duplicate()
	$CollisionShape2D.shape.radius = radius
	var img_size = $Sprite.texture.get_size().x/2
	$Sprite.scale = Vector2(1,1) * radius / img_size
	orbit_position.position.x = radius + 25
	rotation_speed *= muter
	print(muter)
	#print (pow(-muter, randi() % 2)  )
	

func _process(delta):
	$Pivot.rotation += rotation_speed * delta
	
func implode():
	$AnimationPlayer.play("Implode")
	yield($AnimationPlayer, "animation_finished")
	queue_free()
