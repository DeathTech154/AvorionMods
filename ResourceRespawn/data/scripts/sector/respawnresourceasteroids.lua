if onServer() then

package.path = package.path .. ";data/scripts/lib/?.lua"
local SectorGenerator = require("SectorGenerator")
local Placer = require("placer")




-- Don't remove or alter the following comment, it tells the game the namespace this script lives in. If you remove it, the script will break.
-- namespace RespawnResourceAsteroids
RespawnResourceAsteroids = {}

function RespawnResourceAsteroids.initialize()
    -- Config
    SSector = {-154, 422}
    RespawnAll = 0
    -- End Config
    print("Attempting to spawn asteroids.")
    SectLocX, SectLocY = Sector():getCoordinates()
    SectLoc = {SectLocX,SectLocY}
    --print(tostring(SSector[1])..tostring(SSector[2]))
    --print(tostring(SectLoc[1])..tostring(SectLoc[2]))
    if RespawnAll == 0 then
      --print("Only Respawning Resources in Spawn Sector")
    else 
      --print("Resource Respawn for all")
      SSector = SectLoc
    end
    if SectLoc[1] == SSector[1] then
    if SectLoc[2] == SSector[2] then
    print("Found Starting Sector")
    print("Attempting to spawn asteroids.")
    local richAsteroids = {Sector():getEntitiesByComponent(ComponentType.MineableMaterial)}
    if #richAsteroids >= 5 then return end

    -- respawn them
    local asteroids = {Sector():getEntitiesByType(EntityType.Asteroid)}
    local generator = SectorGenerator(Sector():getCoordinates())

    local spawned = {}

    for _, asteroid in pairs(asteroids) do

        local sphere = Sphere(asteroid.translationf, 200.0)
        local others = {Sector():getEntitiesByLocation(sphere)}

        local numEmptyAsteroids = 0
        if #others >= 20 then
            for _, entity in pairs(others) do
                if entity:hasComponent(ComponentType.MineableMaterial) then
                    numEmptyAsteroids = 0
                    break
                end

                if entity.type == EntityType.Asteroid then
                    numEmptyAsteroids = numEmptyAsteroids + 1
                end
            end
        end

        if numEmptyAsteroids >= 20 then
            local translation = sphere.center + random():getDirection() * sphere.radius
            local size = random():getFloat(5.0, 15.0)

            local asteroid = generator:createSmallAsteroid(translation, size, true, generator:getAsteroidType())

            table.insert(spawned, asteroid)
            print("Added Asteroid.")
        end
    end
    Placer.resolveIntersections(spawned)
    print("Asteroids were placed.")
    end
    end
end


end
