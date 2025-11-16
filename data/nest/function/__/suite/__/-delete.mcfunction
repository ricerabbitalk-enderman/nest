## Get errors.
scoreboard players operation #nest:__/suite/-delete|errors -- = @s nest.suite.errors

## Kill.
execute on passengers run kill @s
kill @s

## Return state.
execute if score #nest:__/suite/-delete|errors -- matches 1.. run return run scoreboard players get #nest|fail --
return run scoreboard players get #nest|pass --
