extends CharacterBody2D
class_name Player

@export var tile_size: int = 16
@export var move_speed: float = 72.0

var target_position: Vector2
var moving: bool = false

@onready var ray_right: RayCast2D = $Detectors/Right 
@onready var ray_left: RayCast2D = $Detectors/Left
@onready var ray_down: RayCast2D = $Detectors/Down
@onready var ray_up: RayCast2D = $Detectors/Up

func _ready() -> void:
	global_position = Vector2(snappedi(global_position.x, tile_size) + 8, snappedi(global_position.y, tile_size) + 2)
	target_position = position

func _physics_process(delta: float) -> void:
	if moving:
		position = position.move_toward(target_position, move_speed * delta)
		moving = position != target_position
		return

	var direction: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_right") and not ray_right.is_colliding(): direction = Vector2.RIGHT
	elif Input.is_action_pressed("ui_left") and not ray_left.is_colliding(): direction = Vector2.LEFT
	elif Input.is_action_pressed("ui_down") and not ray_down.is_colliding(): direction = Vector2.DOWN
	elif Input.is_action_pressed("ui_up") and not ray_up.is_colliding(): direction = Vector2.UP

	if direction != Vector2.ZERO:
		target_position = position + direction * tile_size
		moving = true
