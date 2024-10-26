extends Node2D

var parent = get_parent()
var collision_list:Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(collision_list)



func deal_collision_damage():
	for item in collision_list:
		parent.knockback_impulse += (parent.position - item.position) * 1000

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		if body.has_node("health_component"):
			collision_list.append(body)


func _on_body_exited(body):
	if collision_list.has(body):
		collision_list.erase(body)
