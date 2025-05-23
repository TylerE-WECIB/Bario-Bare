extends Microgame

@export var ball : PackedScene

var rng = RandomNumberGenerator.new()

var ball_images := []
var cue_ball
@export var START_POS = Vector2(250, rng.randf_range(1,719))
var taking_shot : bool
var cue_ball_in : bool

func load_images():
	for i in range(1, 17, 1):
		var filename = str("res://Art/poolArt/balls/ball (", i, ").png")
		var ball_image = load(filename)
		ball_images.append(ball_image)

func _ready():
	setup()

func _process(_delta: float):
	var moving = false # checks if the balls are moving
	if !cue_ball_in and !moving:
		if cue_ball.collided_already:
			Global.winGame.emit()
	else:
		Global.loseGame.emit()
		gameActive = false

	for b in get_tree().get_nodes_in_group("Balls"):
		if b.linear_velocity.length() > 0 and b.linear_velocity.length() < 5.0:
			b.sleeping = true
		elif b.linear_velocity.length() >= 5: # if any balls at all are moving sets the variable to true
			moving = true
	
	if not moving:
		if not taking_shot:
			taking_shot = true
	else:
		if taking_shot:
			taking_shot = false
			$cue.hide()
			$cue.set_process(false)

func setup():
	super()
	
	load_images()
	print("3. start BREAK IT's processes")
	start()
	$table/pockets.body_entered.connect(in_ball)
	
func start():
	generate_balls()
	reset_cue_ball()
	show_cue()
	
func generate_balls(): # Sets up balls
	var count : int = 0
	var rows : int = 1
	var dia = 37
	for col in range(5):
		for row in range(rows):
			var b = ball.instantiate()
			var pos = Vector2(850 + (col * dia), 350 - (row * dia) + (col * dia / 2)) # fix positioning later
			add_child(b)
			b.position = pos
			b.get_node("Sprite2D").texture = ball_images[count]
			count += 1
		rows += 1

func remove_cue_ball():
	var old_b = cue_ball
	remove_child(old_b)
	old_b.queue_free()
	

func reset_cue_ball():
	cue_ball = ball.instantiate()
	cue_ball.ball_type = "cue"
	add_child(cue_ball)
	cue_ball.position = START_POS
	cue_ball.get_node("Sprite2D").texture = ball_images.back()
	taking_shot = false
	
func show_cue():
	$cue.set_process(true)
	$cue.show()
	if !cue_ball_in:
		$cue.position = cue_ball.position

func in_ball(body):
	if body == cue_ball:
		cue_ball_in = true
		remove_cue_ball()
	else:
		remove_child(body)

func _on_cue_shoot(power):
	if gameActive:
		cue_ball.apply_central_impulse(power)
