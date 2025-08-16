extends Node2D

@onready var spawn_points: Node2D = $SpawnPoints
@onready var timer: Timer = $"../Timer"
var bullet
var bullet_scene = preload("res://Scenes/Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Shoot"):
		timer.start() # Start the timer when the shoot action is pressed
		bullet = bullet_scene.instantiate()
		bullet.global_position = spawn_points.position# Set bullet's position to gun's position
		get_parent().add_child(bullet)
		


func _on_timer_timeout() -> void:
	bullet.queue_free() # Remove bullet from the scene after the timer times out
	bullet = null # Clear the bullet variable
	timer.stop() # Stop the timer
