local defsave = require("defsave.defsave")
local onboarding = {}

function onboarding.init()
    onboarding.first_game = defsave.get("onboarding", "first_game")
end

return onboarding