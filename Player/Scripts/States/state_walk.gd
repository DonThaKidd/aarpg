class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle: State = $"../Idle"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# what happens when the player enters this state.
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

# what happens when the player enters this state.
func Exit() -> void:
	pass

# what happens during the process update in this state?
func Process( _delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	return null

# what happens during the physics update in this state?
func Physics( _delta : float) -> State:
	return null

# what happens with Input events in this state?
func HandleInput( _event : InputEvent) -> State:
	return null