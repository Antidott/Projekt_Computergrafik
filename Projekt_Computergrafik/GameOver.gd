extends Control

# Function to restart the game (or go to main menu)
func _on_RestartButton_pressed():
	get_tree().change_scene("res://MainScene.tscn")  # Adjust path to your main scene
