extends Node2D

var start = false
@onready var ground_1: Node2D = $ground1
@onready var ground_2: Node2D = $ground2

var speed =80
var width = 5120
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		start = true
		
	if start :
		#background and pipes movement
		ground_1.position.x -= speed * delta
		ground_2.position.x -= speed * delta
		$GUIDE.hide()

#make backgrounds infinit
	if ground_1.position.x < -width :
		ground_1.position.x = ground_2.position.x + width
		
	if ground_2.position.x < -width :
		ground_2.position.x = ground_1.position.x + width
		
# score recording
func _on_score_record_area_entered(area: Area2D) -> void:
	score += 1
	#show score on the label
	$score.text = "score "+ str(score)
	
	
