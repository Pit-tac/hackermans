extends Area2D

var speed = 1000
var damage = 10
var pierce = 3
var can_damage:bool = true

var direction:Vector2
var velocity:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta + velocity * delta


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	# checks if the body is an enemy
	# then checks if it has a health_component node
	# then checks if the projectile can damage (has pierce)
	if body.is_in_group("enemy"):
		if body.has_node("health_component"):
			if can_damage:
				body.get_node("health_component").damage_self(damage)
				check_pierce()

func check_pierce():
	pierce -= 1
	if pierce <= 0:
		can_damage = false
		queue_free()
