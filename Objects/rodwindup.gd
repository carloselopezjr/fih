extends Node2D

@onready var anim: AnimatedSprite2D = $Anim
signal finished  # emitted when the animation ends

func play_animation():
	anim.visible = true
	anim.play("windup")

	# Only connect once, then auto-remove
	if not anim.is_connected("animation_finished", Callable(self, "_on_anim_finished")):
		anim.connect("animation_finished", Callable(self, "_on_anim_finished"), CONNECT_ONE_SHOT)

func _on_anim_finished():
	anim.visible = false
	emit_signal("finished")
	queue_free()  # removes the animation from the scene after playing
