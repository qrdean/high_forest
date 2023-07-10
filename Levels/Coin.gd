extends Label

var coins: int = 0

func increment():
	coins += 1
	text = "Coins: " + str(coins)

#func _on_coin_body_entered(_body):
#	coins += 1
#	text = "Coins: " + str(coins)
