extends CanvasLayer

@onready var health_label: Label = $HealthLabel
@onready var coins_label: Label = $CoinsLabel

func set_health(current_health: int, max_health: int) -> void:
	health_label.text = "HP: %d / %d" % [current_health, max_health]

func set_coins(coins: int) -> void:
	coins_label.text = "Moedas: %d" % coins
