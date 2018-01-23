if onServer() then

-- Don't remove or alter the following comment, it tells the game the namespace this script lives in. If you remove it, the script will break.
-- namespace DefaultSector
DefaultSector = {}

function DefaultSector.initialize()
    local dockables = {Sector():getEntitiesByComponent(ComponentType.DockingPositions)}

    for _, entity in pairs(dockables) do
        entity:addScriptOnce("entity/regrowdocks.lua")
    end

    Sector():addScriptOnce("sector/relationchanges.lua")
    Sector():addScriptOnce("sector/reportzoneresources.lua")
end

end
