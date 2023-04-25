extends Node3D


var is_dragging = false
var prev_mouse_pos = Vector3.ZERO


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
				print("set prev pos")

			else:
				is_dragging = false

	elif event is InputEventMouseMotion and is_dragging:
		var event_pos_3d = Vector3(event.position.x, 3, event.position.y)
		
		position += (event_pos_3d - prev_mouse_pos) / 50 * -1
		prev_mouse_pos = event_pos_3d



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("action_leftclick"):
		pass
