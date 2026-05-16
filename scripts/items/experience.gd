extends Area2D

@export var amount: int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("add_experience"):
			body.add_experience(amount)
		queue_free()
