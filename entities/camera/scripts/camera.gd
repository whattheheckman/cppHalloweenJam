extends Marker3D

@export var camera_interpolation := true
@export var smothiness := 0.1
# @export var close_distance := 1.5 # for distance for the camera to sit after raycasts
@export var _player:= %Player

func _process(_delta: float) -> void:
	move_camera()
	

func move_camera() -> void:
	if camera_interpolation:
		if position.distance_to(_player.position) > 0.1:
			position = position.lerp(_player.position, smothiness)
	else:
		position = _player.position



# needs to do a raycast every frame to see if the enviroment is between the player and the enviroment, so the camera should get really close
# maybe a stretch thing
