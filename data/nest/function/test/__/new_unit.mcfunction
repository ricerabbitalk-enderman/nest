## Check key.
execute at @s positioned ~ ~-16 ~ unless entity @e[distance=..1,tag=nest.key] if function nest:test/__/fatal_error \
  at @s as @e[distance=..2,tag=nest.proxy.failure] at @s if function nest:test/__/set_redstone_block run return 1

## Get registry.
execute at @s positioned ~ ~-16 ~ as @e[distance=..1,tag=nest.key] run data modify storage nest:test/__/new_unit key set from entity @s data.nest.key
function nest:__/registry/macro/get with storage nest:test/__/new_unit key

## New.
data modify storage nest:__/unit/-enable << set value {}
data modify storage nest:__/unit/-enable <<.name set from storage nest:test/__/new_unit key.name
data modify storage nest:__/unit/-enable <<.data set from storage nest:__/registry/macro/get >>
execute summon minecraft:text_display run function nest:__/unit/-enable

## Success.
return 1
