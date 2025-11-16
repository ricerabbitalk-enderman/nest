## Runnable.
execute unless function nest:__/suite/__/-runnable if function nest:__/suite/__/-report run return run function nest:__/suite/__/-delete

## Run.
execute unless function nest:__/suite/__/-running unless function nest:__/suite/__/-run run return run scoreboard players get #nest|error --

## Update.
execute on passengers if entity @s[type=minecraft:text_display,tag=nest.case,tag=nest.case.running] \
  store result score #nest:__/suite/-update|state -- run function nest:__/case/-update
execute if score #nest:__/suite/-update|state -- = #nest|continue -- run return run scoreboard players get #nest|continue --

## Set result.
scoreboard players add @s nest.suite.cases 1
execute if score #nest:__/suite/-update|state -- <= #nest|fail -- run scoreboard players add @s nest.suite.errors 1
execute if score #nest:__/suite/-update|state -- >= #nest|pass -- run scoreboard players add @s nest.suite.passes 1

## Teardown.
execute unless function nest:__/suite/__/-teardown run return run scoreboard players get #nest|error --

## Abort.
execute if score #nest:__/suite/-update|state -- = #nest|error -- if function nest:__/suite/__/-report run return run function nest:__/suite/__/-abort

##Continue.
return run scoreboard players get #nest|continue --
