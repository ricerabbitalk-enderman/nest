## Runnable.
execute unless function nest:__/unit/__/-runnable run return run function nest:__/unit/-exit

## Run.
execute unless function nest:__/unit/__/-running run function nest:__/unit/__/-run
## Update.
execute on passengers if entity @s[type=minecraft:text_display,tag=nest.suite] \
  store result score #nest:__/unit/-update|state -- run function nest:__/suite/-update
## Fail.
execute if score #nest:__/unit/-update|state -- <= #nest|fail -- run tag @s add nest.unit.failure
## Error.
execute if score #nest:__/unit/-update|state -- = #nest|error -- run return run function nest:__/unit/-abort

## Continue.
return run scoreboard players get #nest|continue --
