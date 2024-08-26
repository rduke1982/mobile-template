local defsave = require("defsave.defsave")
local player = {}

function player.init()
    player.foo = defsave.get("player", "foo")
    player.bar = defsave.get("player", "bar")
end

return player