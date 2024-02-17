Client.OnStart = function()
    loadGitHub()
end

Client.Tick = function(dt)
    -- nothing
end

loadGitHub = function()
    loadFromGitHub("https://raw.githubusercontent.com/Nanskipp/project-cuboid/main/scripts/world_generator.lua",
    function(obj)
        test = obj
    end)
end

loadFromGitHub = function(url, callback)
    HTTP:Get(url, function(res)
        if res.StatusCode ~= 200 then
          print("Error on github loading. Code: " .. res.StatusCode)
          return
        end
        local obj = load(res.Body:ToString())()

        callback(obj)
      end)
end