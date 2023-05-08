extends Node3D

# constants
const DIRECTION_ARR = [
					Vector3i(+1, 0, -1), #mid right
					Vector3i(+1, -1, 0), #top right
					Vector3i(0, -1, +1), #top left
					Vector3i(-1, 0, +1), #mid left
					Vector3i(-1, +1, 0), #bot left
					Vector3i(0, +1, -1) #bot right
					]

# unit stats
@export var move_stat : int = 2
@export var attack_stat : int = 10
@export var gather_stat : int = 20
@export var health_stat : int = 100


# unit variables
var coords : Vector3i

var move_left: int = move_stat
var health : int = health_stat
var leader: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_turn():
	move_left = move_stat
	
