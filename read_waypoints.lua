-- Load the JSON library
local json = require("json")

-- Function to read JSON data from a file
local function readJsonFile(filename)
    local file = fs.open(filename, "r")
    if not file then
        error("Failed to open file: " .. filename)
    end
    local content = file.readAll()
    file.close()
    return json.decode(content)
end

-- Function to get waypoints from JourneyMap
local function getWaypoints()
    local waypoints = {}
    local waypointDir = "/journeymap/data/mp/YOUR_WORLD_NAME/waypoints/"
    
    if not fs.exists(waypointDir) then
        error("Waypoint directory does not exist: " .. waypointDir)
    end
    
    local files = fs.list(waypointDir)
    for _, file in ipairs(files) do
        if file:match("%.json$") then
            local waypoint = readJsonFile(waypointDir .. file)
            table.insert(waypoints, waypoint)
        end
    end
    
    return waypoints
end

return {
    getWaypoints = getWaypoints
}
