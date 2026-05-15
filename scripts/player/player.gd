extends CharacterBody2D

signal health_changed(current_health: int, max_health: int)
signal died

@export var speed: float = 260.0
@export var max_health: int = 100
@export var attack_damage: int = 25
@export var attack_cooldown: float = 0.35
@export var attack_feedback_time: float = 0.12

var current_health: int
var _is_dead := false
var _can_attack := true

@onready var attack_area: Area2D = $AttackArea
@onready var attack_feedback: ColorRect = $AttackFeedback
@onready var attack_cooldown_timer: Timer = $AttackCooldownTimer
@onready var attack_feedback_timer: Timer = $AttackFeedbackTimer

func _ready() -> void:
	current_health = max_health
	attack_cooldown_timer.wait_time = attack_cooldown
	attack_feedback_timer.wait_time = attack_feedback_time
	attack_feedback.visible = false
	health_changed.emit(current_health, max_health)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		_attack()

func _physics_process(_delta: float) -> void:
	if _is_dead:
		return

	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	move_and_slide()

func take_damage(amount: int) -> void:
	if _is_dead:
		return

	current_health = max(current_health - amount, 0)
	health_changed.emit(current_health, max_health)

	if current_health == 0:
		_die()

func _attack() -> void:
	if _is_dead or not _can_attack:
		return

	_can_attack = false
	attack_feedback.visible = true
	attack_cooldown_timer.start()
	attack_feedback_timer.start()

	for body in attack_area.get_overlapping_bodies():
		if body.is_in_group("enemies") and body.has_method("take_damage"):
			body.take_damage(attack_damage)

func _die() -> void:
	_is_dead = true
	velocity = Vector2.ZERO
	died.emit()

func _on_attack_cooldown_timer_timeout() -> void:
	_can_attack = true

func _on_attack_feedback_timer_timeout() -> void:
	attack_feedback.visible = false