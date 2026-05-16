extends Node2D

@onready var player = $Player
@onready var hud = $HUD

var coins_collected := 0

func _ready() -> void:
	player.health_changed.connect(hud.set_health)
	player.experience_changed.connect(hud.set_experience)
	player.stats_changed.connect(hud.set_stats)
	player.died.connect(_restart_scene)
	hud.set_health(player.current_health, player.max_health)
	hud.set_experience(player.current_experience, player.experience_to_next_level, player.level)
	hud.set_stats(player.level, player.attack_damage, player.max_health)
	hud.set_coins(coins_collected)

	for coin in get_tree().get_nodes_in_group("coins"):
		coin.collected.connect(_on_coin_collected)

func _restart_scene() -> void:
	get_tree().call_deferred("reload_current_scene")

func _on_coin_collected() -> void:
	coins_collected += 1
	hud.set_coins(coins_collected)
