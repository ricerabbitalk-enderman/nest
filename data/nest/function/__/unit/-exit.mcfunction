## Message.
#say unit: exit.

## Get state.
scoreboard players set #nest:__/unit/-update|failure -- 0
execute as @s[tag=nest.unit.failure] run scoreboard players set #nest:__/unit/-update|failure -- 1

## Kill.
execute on passengers run kill @s
kill @s
## Return result.
execute if score #nest:__/unit/-update|failure -- matches 0 run return run scoreboard players get #nest|pass --
execute unless score #nest:__/unit/-update|failure -- matches 0 run return run scoreboard players get #nest|fail --
