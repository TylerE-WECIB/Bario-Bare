extends Microgame

# asset scenes
@export var targetScene: PackedScene
@export var projectileScene: PackedScene

# node variables
@onready var targetSpawnPosition = $TargetSpawnPoint.global_position
@onready var projectileSpawnPosition = $ProjectileSpawnPoint.global_position
@onready var targetSpawnerTimer = $TargetSpawnerTimer
@onready var goalLabel = $GoalLabel

# level-specific variables
var canShoot = false
var hits = 0
var goal = 5

func _ready() -> void:
	setup()
	
	
func setup():
	super()
	
	print("3. start HIT THEM's processes")
	hits = 0
	updateGoalLabel()
	targetSpawnerTimer.start()

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		print("Spacebar pressed")
		var projectile = projectileScene.instantiate()
		projectile.position = projectileSpawnPosition
		projectile.hitThemTargetHit.connect(incrementHits)
		add_child(projectile)

func _on_target_spawner_timer_timeout() -> void:
	print("Spawining a target")
	var target = targetScene.instantiate()
	target.position = targetSpawnPosition
	add_child(target)

func _on_game_timer_timeout():
	super()
	print("Stop HIT THEM's processes")
	targetSpawnerTimer.stop()

func incrementHits():
	hits += 1
	print("hits: ", hits)
	goalLabel.set_text("Hits: " + str(hits) + " / " + str(goal))
	if hits >= goal:
		clearHitThem()
		Global.winGame.emit()

func clearHitThem():
	targetSpawnerTimer.stop()
	for target in get_tree().get_nodes_in_group("HitThemTargets"):
		target.queue_free()
	for projectile in get_tree().get_nodes_in_group("HitThemProjectiles"):
		projectile.queue_free()

func updateGoalLabel():
	goalLabel.set_text("Hits: " + str(hits) + " / " + str(goal))
