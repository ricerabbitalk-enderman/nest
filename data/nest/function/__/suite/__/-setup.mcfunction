## Check.
execute unless data entity @s data.nest.suite.__setup run return 1

## Message.
#say suite: setup.
## Setup.
data modify storage nest:__/alias/macro/call << merge value {}
data modify storage nest:__/alias/macro/call <<.name set from entity @s data.nest.suite.__setup
execute store success score #nest:__/suite/__/-setup|success -- at @s run function nest:__/alias/macro/call with storage nest:__/alias/macro/call <<

## Fatal error.
execute if score #nest:__/suite/__/-setup|success -- matches 0 \
  run return run function nest:__/suite/__/macro/fatal_error with storage nest:__/alias/macro/call <<

## Success.
return 1