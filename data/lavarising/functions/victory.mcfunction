scoreboard players reset alive alive_players
scoreboard players set period time 3

title @a[gamemode=!survival] title {"text":"GAME OVER!","color":"gold","bold":true}
title @a[gamemode=!survival] subtitle [{"selector":"@a[gamemode=survival]"},{"text":" has won the game."}]

title @a[gamemode=survival] title {"text":"YOU WON!","color":"gold","bold":true}
title @a[gamemode=survival] subtitle [{"text":"Congratulations."}]

execute as @a at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~
effect give @a resistance 9999 255 true
execute as @a at @s run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Flight:1,Explosions:[{Type:1,Flicker:0,Trail:0,Colors:[I;15435844],FadeColors:[I;14602026]}]}}}}