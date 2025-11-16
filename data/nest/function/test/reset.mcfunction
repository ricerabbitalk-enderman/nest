## New key.
data modify storage nest:test/reset key set value {}
data modify storage nest:test/reset key.name set from storage nest:test/reset <<.unit
data modify storage nest:__/registry/macro/set << set from storage nest:test/reset <<.data
function nest:__/registry/macro/set with storage nest:test/reset key

## Success.
return 1