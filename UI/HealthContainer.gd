extends Container

var health : Array[HealthNode]

func _ready():
	for child in get_children():
		if child is HealthNode:
			child.health_empty.visible = false
			child.health_pip.visible = true
			health.append(child)


func take_damage():
	for i in range(health.size()):
		if !health[i].health_empty.visible:
			health[i].health_empty.visible = true
			health[i].health_pip.visible = false
			break
