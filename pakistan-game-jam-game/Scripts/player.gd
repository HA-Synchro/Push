extends CharacterBody2D

@export var speed = 200
@onready var gun = $GUN
@onready var spawnpoints = $GUN/SpawnPoints
#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var input = Input.get_vector("left", "right", "forward", "backwards")
	var movement_dir = Vector2(input.x, input.y).normalized()
	velocity.x = movement_dir.x * speed
	velocity.y = movement_dir.y * speed
	move_and_slide()
# func _unhandled_input(event: InputEvent) -> void:
	# if event is InputEventMouseMotion:
		#gun.look_at(get_global_mouse_position())
		#spawnpoints.look_at(get_global_mouse_position())

	
