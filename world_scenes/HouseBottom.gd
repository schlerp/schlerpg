extends StaticBody2D

signal enter_house

func _on_Area2D_body_entered(body):
	emit_signal("enter_house")
