class_name State_Idle extends State

@onready var walk: State_Walk = $"../Walk"
@onready var attack: State_Attack = $"../Attack"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# what happens when the player enters this state.
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

# what happens when the player enters this state.
func Exit() -> void:
	pass

# what happens during the process update in this state?
func Process( _delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

# what happens during the physics update in this state?
func Physics( _delta : float) -> State:
	return null

# what happens with Input events in this state?
func HandleInput( _event : InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
