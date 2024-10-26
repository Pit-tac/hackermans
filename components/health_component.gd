extends Node2D

@export var HEALTH = 100
@export var CONTACT_DAMAGE = 10
@onready var health = HEALTH


func damage_self(dmg):
	health -= dmg
	if health <= 0:
		get_parent().queue_free()
	print(health)
