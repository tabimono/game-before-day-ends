extends CharacterBody2D

@onready var hurt_bix: Area2D = $HurtBix

func _ready() -> void:
	hurt_bix.body_entered.connect(_on_hurtbox_box_entred)
	pass

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_vector * 100
	move_and_slide()

func _on_hurtbox_box_entred(body):
	Events.ballon_popped.emit()
	queue_free()
