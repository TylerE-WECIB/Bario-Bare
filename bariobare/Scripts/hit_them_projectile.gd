extends Node2D

@export var speed = 500
var direction = Vector2(0,-1)
var movement = direction * speed

signal hitThemTargetHit

func _ready() -> void:
	pass

#func _process(delta: float) -> void:
	#pass

func _physics_process(delta: float) -> void:
	position += movement * delta
	
	if position.y <= -64: # delete off-screen projectiles
		print("Deleting an off-screen projectile")
		self.queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.owner.is_in_group("HitThemTargets"):
		hitThemTargetHit.emit()
		area.owner.queue_free()
		self.queue_free()
