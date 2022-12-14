extends CharacterBody3D

@export var speed := 4
@export var gravity := 9.8
@export var rotation_speed := 4.0

@onready var _model_pivot: Node3D = $ModelPivot

var battery_left

const PI_HALF := PI/2


var _h_rot := 0.0
var _direction := Vector3.ZERO

func _physics_process(delta: float) -> void:
	character_movement(delta)
	battery_left = ((($Timer.time_left/6000) / 10) * .2)
	print_debug(battery_left)
	if battery_left <= 5:
		pass
	if battery_left <= 0:
		get_tree().change_scene_to_file("res://ui/winlose/lose.tscn")

func character_movement(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
		

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	_h_rot = Vector2(input_dir.x, -input_dir.y).angle()
	
	_direction.x = input_dir.x
	_direction.z = input_dir.y
	
	if _direction:
		velocity.x = _direction.x * speed
		velocity.z = _direction.z * speed
		
		var rot = lerp_angle(_model_pivot.rotation.y, _h_rot + PI_HALF, delta * rotation_speed)
		_model_pivot.rotation.y = rot
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	move_and_slide()
