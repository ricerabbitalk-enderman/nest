## Update.
execute store result score #nest:test/__/-update_unit|result -- run function nest:__/unit/-update

## Set result.
# Success
execute if score #nest:test/__/-update_unit|result -- >= #nest|pass -- \
  at @s as @e[distance=..2,tag=nest.proxy.success] at @s if function nest:test/__/set_redstone_block run kill @s
# Failure
execute if score #nest:test/__/-update_unit|result -- <= #nest|fail -- \
  at @s as @e[distance=..2,tag=nest.proxy.failure] at @s if function nest:test/__/set_redstone_block run kill @s

## Return result.
return run scoreboard players get #nest:test/__/-update_unit|result --