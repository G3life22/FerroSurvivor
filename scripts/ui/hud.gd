extends CanvasLayer

@onready var health_label: Label = $HealthLabel
@onready var coins_label: Label = $CoinsLabel
@onready var experience_label: Label = $ExperienceLabel
@onready var stats_label: Label = $StatsLabel

func set_health(current_health: int, max_health: int) -> void:
	health_label.text = "HP: %d / %d" % [current_health, max_health]

func set_coins(coins: int) -> void:
	coins_label.text = "Moedas: %d" % coins

func set_experience(current_experience: int, experience_to_next_level: int, level: int) -> void:
	experience_label.text = "Level: %d | XP: %d / %d" % [level, current_experience, experience_to_next_level]

func set_stats(level: int, attack_damage: int, max_health: int) -> void:
	stats_label.text = "Dano: %d | Vida Max: %d" % [attack_damage, max_health]
