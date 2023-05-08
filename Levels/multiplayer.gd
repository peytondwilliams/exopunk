extends Node

var multiplayer_peer = ENetMultiplayerPeer.new()

const PORT = 9999
const ADDRESS = "localhost"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_host_pressed():
	multiplayer_peer.create_server(PORT)
	multiplayer.multiplayer_peer = multiplayer_peer
	start_game()


func _on_join_pressed():
	multiplayer_peer.create_client(ADDRESS, PORT)
	multiplayer.multiplayer_peer = multiplayer_peer
	start_game()

	
func start_game():
	$UI.hide()
	
	if not multiplayer.is_server():
		add_player(multiplayer.get_unique_id())
		print("not server")
		return

	# For 4x game, clients don't need to know about other players besides host
	#multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(del_player)

	# Spawn already connected players.
	for id in multiplayer.get_peers():
		add_player(id)
		
	if not OS.has_feature("dedicated_server"):
		add_player(1)	


func add_player(id: int):
	var player_character = preload("res://Player/player.tscn").instantiate()
	player_character.set_multiplayer_authority(id)
	player_character.player = id
	print(id)
	player_character.select_hex.connect($Level.get_child(0)._on_player_select_hex)
	$Level.add_child(player_character, true)
	
	
func _exit_tree():
	if not multiplayer.is_server():
		return
	#multiplayer.peer_connected.disconnect(add_player)
	multiplayer.peer_disconnected.disconnect(del_player)
	

func del_player(id: int):
	if not $Level.has_node(str(id)):
		return
	$Level.get_node(str(id)).queue_free()

