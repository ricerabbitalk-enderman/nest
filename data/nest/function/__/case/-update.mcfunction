## Initialize scoreboards.
scoreboard players set #nest:__/case/-update|success -- 0
scoreboard players set #nest:__/case/-update|state -- 0

## Call case.
data modify storage nest:__/alias/macro/call << merge value {}
data modify storage nest:__/alias/macro/call <<.name set from entity @s data.nest.case.__case
execute store success score #nest:__/case/-update|success -- store result score #nest:__/case/-update|state -- \
  at @s run function nest:__/alias/macro/call with storage nest:__/alias/macro/call <<

## Fatal error.
execute if score #nest:__/case/-update|success -- matches 0 if function nest:__/case/__/-delete run return run function nest:__/case/__/fatal_error

## End case.
# Error.
execute if score #nest:__/case/-update|state -- = #nest|error -- if function nest:__/case/__/-delete run return run function nest:__/case/__/error
# Fail.
execute if score #nest:__/case/-update|state -- = #nest|fail -- if function nest:__/case/__/-delete run return run function nest:__/case/__/fail
# Pass.
execute if score #nest:__/case/-update|state -- = #nest|pass -- if function nest:__/case/__/-delete run return run function nest:__/case/__/pass

## Update tick.
scoreboard players add @s nest.case.tick 1
## Continue.
return run scoreboard players get #nest|continue --