if onServer() then

package.path = package.path .. ";data/scripts/lib/?.lua"
local SectorGenerator = require("SectorGenerator")
require ("stringutility")

-- Don't remove or alter the following comment, it tells the game the namespace this script lives in. If you remove it, the script will break.
-- namespace ZoneResources
ZoneResources = {}

function ZoneResources.initialize()
    Sector():registerCallback("onPlayerEntered", "onPlayerEntered")
end

function ZoneResources.onPlayerEntered(playerIndex)
    local player = Player(playerIndex)
    local generator = SectorGenerator(Sector():getCoordinates())
    local sectortype = generator:getAsteroidType()
    local Ssectortype = tostring(sectortype)
    
    if Ssectortype == "Iron" then
      local msg = "The zone you have entered contains resource types. Iron, Titanium"%_T
      player:sendChatMessage("Server", 0, msg)
      player:sendChatMessage("Server", 3, msg)
    elseif Ssectortype == "Titanium" then
      local msg = "The zone you have entered contains resource types. Titanium, Naonite"%_T
      player:sendChatMessage("Server", 0, msg)
      player:sendChatMessage("Server", 3, msg)
    elseif Ssectortype == "Naonite" then
      local msg = "The zone you have entered contains resource types. Naonite, Trinium"%_T
      player:sendChatMessage("Server", 0, msg)
      player:sendChatMessage("Server", 3, msg)
    elseif Ssectortype == "Trinium" then
      local msg = "The zone you have entered contains resource types. Trinium, Xanion"%_T
      player:sendChatMessage("Server", 0, msg)
      player:sendChatMessage("Server", 3, msg)
    elseif Ssectortype == "Xanion" then
      local msg = "The zone you have entered contains resource types. Xanion, Ogonite"%_T
      player:sendChatMessage("Server", 0, msg)
      player:sendChatMessage("Server", 3, msg)
    elseif Ssectortype == "Ogonite" then
      local msg = "The zone you have entered contains resource types. Ogonite, Avorion"%_T
      player:sendChatMessage("Server", 0, msg)
      player:sendChatMessage("Server", 3, msg)
    else
      local msg = "The zone you have entered contains resource types. Avorion"%_T
      player:sendChatMessage("Server", 0, msg)
      player:sendChatMessage("Server", 3, msg)
    end

    --player:sendChatMessage("Server", 0, msg)
    --player:sendChatMessage("Server", 3, msg)
end

end