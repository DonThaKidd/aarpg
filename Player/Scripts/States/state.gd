class_name State extends Node

# Stores a reference to the player that this state belongs to.
static var player : Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# what happens when the player enters this state.
func Enter() -> void:
	pass

# what happens when the player enters this state.
func Exit() -> void:
	pass

# what happens during the process update in this state?
func Process( _delta : float) -> State:
	return null

# what happens during the physics update in this state?
func Physics( _delta : float) -> State:
	return null

# what happens with Input events in this state?
func HandleInput( _event : InputEvent) -> State:
	return null
