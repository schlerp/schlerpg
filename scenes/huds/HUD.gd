extends Control


func _ready():
	$CanvasLayer/OverlayHUD.hide()
	update_labels()


func update_labels():
	$CanvasLayer/MiniHUD/HealthAmount.text = str(PlayerVariables.hp)
	$CanvasLayer/MiniHUD/GoldAmount.text = str(PlayerVariables.gold)
	$CanvasLayer/MiniHUD/LevelAmount.text = str(PlayerVariables.level)
	
	$CanvasLayer/OverlayHUD/OPSCAmount.text = str(PlayerVariables.constitution)
	$CanvasLayer/OverlayHUD/OPSDAmount.text = str(PlayerVariables.dexterity)
	$CanvasLayer/OverlayHUD/OPSSAmount.text = str(PlayerVariables.strength)
	$CanvasLayer/OverlayHUD/OPSIAmount.text = str(PlayerVariables.initiative)


func toggle_overlay():
	if $CanvasLayer/OverlayHUD.is_visible():
		$CanvasLayer/OverlayHUD.hide()
	else:
		$CanvasLayer/OverlayHUD.show()

