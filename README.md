# LocateyMap
this is a collection of scripts to decode journey map data and use it in computercraft (CC: Tweaked)

--Waypoint Reader (read_waypoints.lua):
        --This script reads waypoints from the JourneyMap directory and returns them as a Lua table.

--Mining Program (mining_program.lua):
        --Waypoint Integration:
            The program initializes Rednet and waits for commands.
            It can handle a readWaypoints command to print all waypoints.
            It can handle a navigateTo: command followed by the waypoint name, navigating the turtle to the specified waypoint.
        --Navigation Logic:
            The navigateToWaypoint function uses GPS coordinates to move the turtle to the target waypoint's location.

--Usage

  --Save Scripts:
        Save the json.lua script, read_waypoints.lua script, and mining_program.lua script on your turtle.

  --Run the Mining Program:
        Execute the mining_program.lua script on your turtle.

  --Send Commands from the Hub:
        Use the hub computer to send commands such as readWaypoints to print waypoints or navigateTo:Example Waypoint to navigate to a specific waypoint.

Not sure how I'll be able to grab the waypoints from journey map without copying them over to CC or grabbing them from internet
