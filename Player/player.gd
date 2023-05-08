extends Node3D

signal select_hex(Vector3i)

const RAY_LENGTH = 100
const COLLISION_MASK = 0000000010000000 #layer 8 only

var is_dragging = false
var prev_mouse_pos = Vector3.ZERO

var raycast_result : Dictionary = {}

@export var player := 1 :
	set(id):
		player = id
		print("set id", id)
		# Give authority over the player input to the appropriate peer.
		#set_multiplayer_authority(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			
			if event.is_pressed():
				if not is_dragging:
					is_dragging = true
					
				var event_pos_3d = Vector3(event.position.x, 3, event.position.y)
				prev_mouse_pos = event_pos_3d

			else:
				is_dragging = false

	elif event is InputEventMouseMotion and is_dragging:
		var event_pos_3d = Vector3(event.position.x, 3, event.position.y)
		
		position += (event_pos_3d - prev_mouse_pos) / 50 * -1
		prev_mouse_pos = event_pos_3d


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

		
	if Input.is_action_just_pressed("action_leftclick"):
		
		#if player != multiplayer.get_unique_id():
		#	print("Invalid player", player)
		#	print("unique id", multiplayer.get_unique_id())
		#	return
		
		if "collider" in raycast_result:
			var hex_coords: Vector3i = raycast_result.collider.get_parent().coords
			#select_hex.emit(hex_coords)
			#if (player == 1):
			#	click(hex_coords)
			#else:
			print("player", player)
			click.rpc_id(1, hex_coords)

func _physics_process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var camera3d = $Camera3D
	var from = camera3d.project_ray_origin(mouse_pos)
	var to = from + camera3d.project_ray_normal(mouse_pos) * RAY_LENGTH
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	ray_query.collision_mask = COLLISION_MASK
	raycast_result = space.intersect_ray(ray_query)
	
@rpc("any_peer", "call_local")
func click(coords):
	#var peer_id = multiplayer.get_remote_sender_id()
	#if peer_id = get_multiplayer_authority():
	#print(coords)
	#print(multiplayer.get_remote_sender_id())
	select_hex.emit(coords)
	pass
