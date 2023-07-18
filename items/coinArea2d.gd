extends Area2D

@onready var coin_collect: AudioStreamPlayer = $CoinCollect
@onready var collision: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body):
	if body is Player:
		coin_collect.play()
		visible = false
		body.collect(self)

func _on_coin_collect_finished():
	queue_free()
