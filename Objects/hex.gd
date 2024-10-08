extends Node3D

signal mouse_over

const DIRECTION_ARR = [
					Vector3i(+1, 0, -1), #mid right
					Vector3i(+1, -1, 0), #top right
					Vector3i(0, -1, +1), #top left
					Vector3i(-1, 0, +1), #mid left
					Vector3i(-1, +1, 0), #bot left
					Vector3i(0, +1, -1) #bot right
					]

const RESOURCES = {
	"uranium": {},
	"gold": {},
	"titanium": {}
}

const BIOMES = {
	"ocean": {},
	"barren": {},
	"mountain": {},
}

#const FEATURES = {
#	"mountain": {},
#	"hill": {},
#	"flatland": {},
#}

var coords : Vector3i
var resource = "none"
var biome = "none"
#var feature = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
