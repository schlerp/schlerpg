extends Node


# stat constants
const LEVEL_XP_MAP = {
	1: 20,
	2: 50,
	3: 125,
	4: 200
}
const LEVEL_STAT_MAP = {
	1: {'c': 1, 'd': 1, 's': 1, 'i': 1},
	2: {'c': 1, 'd': 2, 's': 1, 'i': 1},
	3: {'c': 2, 'd': 1, 's': 2, 'i': 1},
	4: {'c': 2, 'd': 3, 's': 2, 'i': 2}
}

# player variables
var experience = 0
var level = 0
var gold = 0
var MIN_HP = 0
var MAX_HP = 13
var hp = 0

# player stats
var constitution = 4  # determines total hp
var dexterity = 3     # determines hit chance with weapon
var strength = 2      # determines physical damage
var initiative = 2    # determines turn order in battles

# player inventory
var inventory = []

func _ready():
	update_max_hp()


func add_experience(xp):
	for _i in range(xp):
		experience += 1
		if experience == LEVEL_XP_MAP[level+1]:
			level += 1
			increase_stats(LEVEL_STAT_MAP[level])
	Global.hud.update_labels()


func increase_stats(stat_inc):
	constitution += stat_inc['c']
	dexterity += stat_inc['d']
	strength += stat_inc['s']
	initiative += stat_inc['i']
	
	# update hp using new constitution
	update_max_hp()


func add_gold(gp):
	gold += gp
	Global.hud.update_labels()


func change_hp(amount):
	hp += amount
	hp = clamp(hp, MIN_HP, MAX_HP)
	Global.hud.update_labels()


func update_max_hp():
	# adjust HP using new constitution
	MAX_HP = constitution * 3
	hp = 0 + MAX_HP

