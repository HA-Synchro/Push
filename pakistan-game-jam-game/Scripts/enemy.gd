extends CharacterBody2D
@onready var target = $"../PlayerGoal"


var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if position > target.global_position:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	var direction = position.direction_to(target.global_position).normalized()
	velocity = speed * direction
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player_Goal"):
		print("Lose")
