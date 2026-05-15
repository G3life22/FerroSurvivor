extends CharacterBody2D

@export var speed: float = 120.0
@export var max_health: int = 50
@export var touch_damage: int = 10
@export var damage_interval: float = 0.6

var current_health: int
var target: Node2D
var _damage_target: Node

@onready var damage_timer: Timer = $DamageTimer

func _ready() -> void:
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

func take_damage(amount: int) -> void:
	current_health = max(current_health - amount, 0)

	if current_health == 0:
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

func _apply_touch_damage() -> void:
	if _damage_target != null and _damage_target.has_method("take_damage"):
		_damage_target.take_damage(touch_damage)