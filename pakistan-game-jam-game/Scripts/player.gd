extends CharacterBody2D

@export var speed = 200
@onready var gun = $GUN
@onready var spawnpoints = $GUN/SpawnPoints
@onready var label = get_node("/root/level/Health")
@export var health = 3
#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if health <= 0:
		print("dead")
	label.text = "Health : " + str(health)

	var input = Input.get_vector("left", "right", "forward", "backwards")
	var movement_dir = Vector2(input.x, input.y).normalized()
	velocity.x = movement_dir.x * speed
	velocity.y = movement_dir.y * speed
	move_and_slide()
# func _unhandled_input(event: InputEvent) -> void:
	# if event is InputEventMouseMotion:
		#gun.look_at(get_global_mouse_position())
		#spawnpoints.look_at(get_global_mouse_position())

	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_bullet"):
		if health <= 0:
			return # Do nothing if already dead
		health -= 1
		label.text = "Health : " + str(health)
		area.queue_free() # Remove the bullet
