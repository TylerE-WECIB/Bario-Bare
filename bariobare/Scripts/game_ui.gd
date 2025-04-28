extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("fuse_test")

func _physics_process(delta: float) -> void:
	$Bomb/Spark.global_position = $Bomb/Path2D/PathFollow2D.global_position
	$Bomb/Path2D/PathFollow2D.progress_ratio = $Bomb/Fuse.value / $Bomb/Fuse.max_value
	$Bomb/Spark.rotation += 1
	
	if $Bomb/Fuse.value == 0:
		$Bomb.frame = 1
		$Bomb/Label.visible = false
	else:
		$Bomb.frame = 0
		$Bomb/Label.visible = true

func _on_microgame_start():
	pass
