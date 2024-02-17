Client.OnStart = function()
    -- nothing
end

Client.Tick = function(dt)
    -- nothing
end

loadGitHub = function()
    test = loadFromGitHub("https://raw.githubusercontent.com/Nanskipp/project-cuboid/main/scripts/world_generator.lua")
end

loadFromGitHub = function()
    HTTP:Get(url, function(res)
        if res.StatusCode ~= 200 then
          print("Error on github loading. Code: " .. res.StatusCode)
          return
        end
        return load(tostring(res.Body))
      end)
end