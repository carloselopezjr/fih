extends Area2D

@export var item_id := "funcle"
@export var amount: int = 1

func on_interact(player):
	if player.has_method("add_item"):
		player.add_item(item_id, amount) # add to inventory
	
	# Clear item
	queue_free()
	
