class_name TurnWheel
extends Control

signal update_turn_ord(turn_list: Array[String])

@onready var button := $Background/MarginContainer/VBoxContainer/Button
@onready var skill_container := $"Background/MarginContainer/VBoxContainer/ColorRect/Skill Slot Container"

func _ready():
	button.disabled = true

func on_open_change_turn() -> void:
	button.disabled = false
	await button.pressed
	var turn_list: Array[String] = []
	for skill in skill_container.get_children(): 
		turn_list.append(skill.name) 
	emit_signal("update_turn_ord", turn_list)
	button.disabled = true
