extends CharacterBody2D

const EXPERIENCE_SCENE := preload("res://scenes/items/experience.tscn")

@export var speed: float = 120.0
@export var level: int = 1
@export var base_max_health: int = 50
@export var health_per_level: int = 20
@export var base_xp_value: int = 1
@export var touch_damage: int = 10
@export var damage_interval: float = 0.6

var max_health: int
var xp_value: int
var current_health: int
var target: Node2D
var _damage_target: Node

@onready var damage_timer: Timer = $DamageTimer
@onready var level_label: Label = $LevelLabel

func _ready() -> void:
	_apply_level_stats()
	current_health = max_health
	damage_timer.wait_time = damage_interval
	target = get_tree().get_first_node_in_group("player") as Node2D

func _physics_process(_delta: float) -> void:
	if target == null:
		velocity = Vector2.ZERO
		return

	var direction := global_position.direction_to(target.global_position)
	velocity = direction * speed
	move_and_slide()

func configure_level(new_level: int) -> void:
	level = max(new_level, 1)
	_apply_level_stats()
	current_health = max_health

func take_damage(amount: int) -> void:
	current_health = max(current_health - amount, 0)

	if current_health == 0:
		_drop_experience()
		queue_free()

func _on_damage_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		_damage_target = body
		_apply_touch_damage()
		damage_timer.start()

func _on_damage_area_body_exited(body: Node2D) -> void:
	if body == _damage_target:
		_damage_target = null
		damage_timer.stop()

func _on_damage_timer_timeout() -> void:
	_apply_touch_damage()

func _apply_level_stats() -> void:
	level = max(level, 1)
	max_health = base_max_health + ((level - 1) * health_per_level)
	xp_value = base_xp_value * level

	if is_node_ready():
		level_label.text = "Nv %d" % level
		level_label.visible = level > 1

func _apply_touch_damage() -> void:
	if _damage_target != null and _damage_target.has_method("take_damage"):
		_damage_target.take_damage(touch_damage)

func _drop_experience() -> void:
	var experience := EXPERIENCE_SCENE.instantiate()
	experience.global_position = global_position
	experience.set("amount", xp_value)
	get_parent().add_child(experience)
