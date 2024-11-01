class_name EnemyStateDestroy extends EnemyState

@export var anim_name : String = "destroy"
@export var knockback_speed : float = 200.0
@export var decelerate_speed : float = 10.0

@export_category("AI")
@export var next_state : EnemyState

var _direction : Vector2

# Called when the node enters the scene tree for the first time.
func init() -> void:
	enemy.enemy_destroyed.connect( _on_enemy_destroyed )
	pass # Replace with function body.


# what happens when the player enters this state.
func Enter() -> void:
	enemy.invulnerable = true
	
	_direction = enemy.global_position.direction_to( enemy.player.global_position )
	
	enemy.set_direction( _direction )
	enemy.velocity = _direction * -knockback_speed
	
	enemy.update_animation( anim_name )
	enemy.animation_player.animation_finished.connect( _on_animation_finished )
	pass

# what happens when the player enters this state.
func Exit() -> void:
	pass

# what happens during the process update in this state?
func process( _delta : float ) -> EnemyState:
	enemy.velocity -= enemy.velocity * decelerate_speed * _delta
	return null

# what happens during the physics update in this state?
func physics( _delta : float) -> EnemyState:
	return null

func _on_enemy_destroyed() -> void:
	state_machine.change_state( self )
	

func _on_animation_finished( _a : String ) -> void:
	enemy.queue_free()
