-- Placeholder for resource collection, spending, and saving
-- Coins used as an example in the original template

local defsave = require("defsave.defsave")

local coins = {}

function coins.init()
    coins.total = defsave.get("coins", "total")
    coins.collected = 0
end

function coins.collect(n)
    coins.collected = coins.collected + (n or 1)
    msg.post("game:/gui#game", "coin_collected")
end

function coins.add_to_total()
    coins.total = coins.total + coins.collected
    coins.collected = 0
    defsave.set("coins", "total", coins.total)
end

function coins.spend(n)
    if n > 0 and coins.total >= n then
        coins.total = coins.total - n
        defsave.set("coins", "total", coins.total)
        return true
    end
    return false
end

function coins.reset()
    coins.collected = 0
end

return coins