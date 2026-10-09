local _, addon = ...
local lastRPText

function addon.CooldownReady()
    return not lastRPText or GetTime() - lastRPText >= addon.db.cooldown
end

function addon.StartCooldown()
    lastRPText = GetTime()
end
