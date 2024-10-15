class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelerate_speed : float = 5.0

@onready var walk : State_Walk = $"../Walk"
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var idle : State_Idle = $"../Idle"
@onready var attack_anim : AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# what happens when the player enters this state.
func Enter() -> void:
	player.UpdateAnimation("attack")
	
	attack_anim.play("attack_" + player.AnimDirection())
	
	animation_player.animation_finished.connect( EndAttack )
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	attacking = true
	pass

# what happens when the player enters this state.
func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	pass

# what happens during the process update in this state?
func Process( _delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta 
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

# what happens during the physics update in this state?
func Physics( _delta : float) -> State:
	return null

# what happens with Input events in this state?
func HandleInput( _event : InputEvent) -> State:
	return null

func EndAttack( _newAnimName : String ) -> void:
	attacking = false
