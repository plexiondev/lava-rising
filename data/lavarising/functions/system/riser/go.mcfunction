# LAVARISING riser
## go (aka. rise)


# teleport up
tp ~ ~1 ~

# announce
title @a actionbar ["",{"text":"The lava has risen to Y: ","color":"red"},{"score":{"name":"riser_height","objective":"internal"},"color":"dark_red","bold":true}]
# sfx
execute if score sfx global matches 1.. as @a at @s run playsound block.lava.pop block @s