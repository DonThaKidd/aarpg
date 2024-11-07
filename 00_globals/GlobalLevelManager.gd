extends Node



var current_tilemap_bounds : Array[ Vector2 ]
var target_transition : String
var position_offset : Vector2


signal TileMapBoundsChanged(bounds : Array [ Vector2 ])
signal level_load_started
signal level_loaded

func _ready() -> void:
	await get_tree().process_frame
	level_loaded.emit()


func ChangeTilemapBounds(bounds : Array[ Vector2 ] ) -> void:
	current_tilemap_bounds = bounds
	TileMapBoundsChanged.emit(bounds)
	pass

func load_new_level(
		level_path : String,
		_target_transition : String,
		_position_offset : Vector2
) -> void:
	
	get_tree().paused = true
	target_transition = _target_transition
	position_offset = _position_offset
	
	await SceneTransition.fade_out()
	
	level_load_started.emit()
	
	await get_tree().process_frame
	
	get_tree().change_scene_to_file( level_path )
	
	await SceneTransition.fade_in()
	
	get_tree().paused = false
	
	await get_tree().process_frame
	
	level_loaded.emit()
	
	pass
