# LAVARISING main loop


# setup
execute as @a unless score setup internal matches 1.. run function lavarising:setup/go

# world
bossbar set lavarising:main players @a

# ensure player is not stuck
execute if score period internal matches -1 as @a at @s unless block ~ ~1 ~ #lavarising:safe run tp @s ~ ~5 ~

# options
execute if score cut_clean global matches 1.. run function lavarising:extras/cut_clean
execute if score speed_uhc global matches 1.. run function lavarising:extras/speed_uhc
execute if score speed_uhc global matches 1.. if score patch_grindstone_exploit global matches 1.. run function lavarising:extras/grindstone

# periods range checks
## starter period
execute unless score starter_period global matches 10.. run scoreboard players set starter_period global 10
## grace period
execute unless score grace_period global matches 400.. run scoreboard players set grace_period global 1200
## rise height limit
execute if score legacy global matches 1.. if score rise_height_limit global matches 257.. run function lavarising:setup/range/rise_height_limit

# performance
execute if score period internal matches 2 if score kill_all_falling_blocks global matches 1.. run kill @e[type=falling_block]
# kill nearby falling blocks
execute if score period internal matches 2 if score kill_nearby_falling_blocks global matches 1.. as @e[type=falling_block] run function lavarising:system/performance/nearby_blocks

# riser main
execute if score period internal matches 2 as @e[tag=riser,limit=1] at @s run function lavarising:system/riser/main

# time loop
function lavarising:time

# death checks
execute if score period internal matches 2 as @a at @s if score @s player.death matches 1.. run function lavarising:system/death/go
execute unless score period internal matches 2 run scoreboard players reset @a player.death

# win checks
## solos
execute if score period internal matches 2 unless score teams global matches 1.. run function lavarising:system/win/solos/check
## teams
execute if score period internal matches 2 if score teams global matches 1.. if score teams_count global matches ..2 run function lavarising:system/win/teams-2/check
execute if score period internal matches 2 if score teams global matches 1.. if score teams_count global matches 3.. run function lavarising:system/win/teams-3/check