extends Node

var Planet = preload("res://Planet.tscn")
var Jumper = preload("res://Jumper.tscn")
var player
var BOING = -1000
var susah = 0
var combo = 0
onready var timer = get_node("Timer")


func _ready():
	
	new_game()
func new_game():
	$Camera2D.position = $startPosition.position
	player = Jumper.instance() 
	player.position = $startPosition.position
	add_child(player)
	player.connect("captured", self, "_on_Jumper_captured")
	spawn_circle($startPosition.position)
	
func spawn_circle(_position=null):
	var A = Planet.instance()
	A.muterNambah(susah)
	if !_position:
		var x = rand_range(-150,150)
		var y = rand_range(-500,-400)
		_position = player.target.position + Vector2(x,y)
	add_child(A)
	A.init(_position)
	
func _on_Jumper_captured(object):
	$Camera2D.position = object.position
	BOING += 1000
	susah += 0.05
	if combo < 10:
		combo += 1
	else:
		combo += 0
	timer.set_wait_time(1)
	timer.start()	
	$CanvasLayer.UpdateCombo(combo)
	$CanvasLayer.UpdatePoint(BOING * combo)
	print(combo)

	call_deferred("spawn_circle")

func _on_Timer_timeout():
	if combo != 1:
		combo -= 1
		$CanvasLayer.UpdateCombo(combo)
