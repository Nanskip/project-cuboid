
-- This is world generator module that creates map with chunks.

generator = {}

generator.createWorld = function(config)
    local defaultConfig = {
        chunkSize = 8,
        worldSize = Number2(10, 10)
    }
    -- Default chunk size is 8, default world size in chunks is 10x10.
    -- That means world will be 80x80 units.

    chunkSize = config.chunkSize or defaultConfig.chunkSize
    worldSize = config.worldSize or defaultConfig.worldSize

    world = {}

    for x=0, worldSize.X do
        world[x] = {}
        for y=0, worldSize.Y do
            chunk = {}
            for chunkX=1, chunkSize do
                cY = {}
                for chunkY=1, chunkSize do
                    local data = {
                        color = Color(255, 255, 0)
                    }

                    cY[chunkY] = data
                end
                chunk[chunkX] = cY
            end
            world[x][y] = chunk
        end
    end

    for x=0, worldSize.X do
        for y=0, worldSize.Y do
            for chunkX=1, chunkSize do
                for chunkY=1, chunkSize do
                    local block = Block(world[x][y][chunkX][chunkY], Number3(x*chunkX, 0, y*chunkY))

                    Map:AddBlock(block)
                end
            end
        end
    end
end

return generator