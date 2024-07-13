-- Load other scripts
local waypointsReader = require("read_waypoints")

-- Initialize Rednet
rednet.open("left")  -- Adjust the side as necessary

-- Function to navigate to a specific waypoint
local function navigateToWaypoint(waypoint)
    local x, y, z = gps.locate()
    if not x then
        error("Failed to get GPS location")
    end

    local targetX, targetY, targetZ = waypoint.x, waypoint.y, waypoint.z

    -- Navigate in the X direction
    while x ~= targetX do
        if x < targetX then
            turtle.forward()
            x = x + 1
        elseif x > targetX then
            turtle.back()
            x = x - 1
        end
    end

    -- Navigate in the Z direction
    while z ~= targetZ do
        if z < targetZ then
            turtle.forward()
            z = z + 1
        elseif z > targetZ then
            turtle.back()
            z = z - 1
        end
    end

    -- Navigate in the Y direction
    while y ~= targetY do
        if y < targetY then
            turtle.up()
            y = y + 1
        elseif y > targetY then
            turtle.down()
            y = y - 1
        end
    end
end

-- Main loop to receive and execute commands
while true do
    local senderID, message, protocol = rednet.receive()
    state.logState("Received command: " .. message)
    
    if message == "readWaypoints" then
        local waypoints = waypointsReader.getWaypoints()
        for _, waypoint in ipairs(waypoints) do
            print("Waypoint: " .. waypoint.name .. " at (" .. waypoint.x .. ", " .. waypoint.y .. ", " .. waypoint.z .. ")")
        end
    elseif message:match("navigateTo:") then
        local waypointName = message:sub(12)
        local waypoints = waypointsReader.getWaypoints()
        for _, waypoint in ipairs(waypoints) do
            if waypoint.name == waypointName then
                navigateToWaypoint(waypoint)
                break
            end
        end
    elseif actions[message] then
        actions[message]()
    else
        print("Unknown command: " .. message)
    end
end
