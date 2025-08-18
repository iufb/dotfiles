#!/usr/bin/env lua

-- Helper function: run a command and get output lines as a table
local function run_cmd_lines(cmd)
    local lines = {}
    local handle = io.popen(cmd)
    for line in handle:lines() do
        table.insert(lines, line)
    end
    handle:close()
    return lines
end

print("Detecting HDMI monitor...")
-- Detect HDMI monitor
local hdmi_monitor
for _, line in ipairs(run_cmd_lines("xrandr")) do
    local name, rest = line:match("^(HDMI%S+)%s+(.*)$")
    if name then
        hdmi_monitor = name
        break
    end
end

if not hdmi_monitor then
    print("No HDMI monitor detected")
    os.exit(1)
end
print("HDMI monitor detected:", hdmi_monitor)

-- Check if HDMI is active
print("Checking if HDMI is active...")
local hdmi_active = false
for _, line in ipairs(run_cmd_lines("xrandr")) do
    local name, res = line:match("^(HDMI%S+)%s+connected%s+(%S+)")
    if name == hdmi_monitor and res then
        -- Only active if resolution has '+' (x+y position)
        if res:find("%+") then
            hdmi_active = true
        end
        break
    end
end
print("HDMI active status:", hdmi_active)

-- Detect audio sinks
print("Detecting audio sinks...")
local hdmi_sink, analog_sink
for _, line in ipairs(run_cmd_lines("pactl list short sinks")) do
    local id, name = line:match("^(%d+)%s+(%S+)")
    if name:lower():find("hdmi") then
        hdmi_sink = name
    elseif name:lower():find("analog") then
        analog_sink = name
    end
end

if not hdmi_sink or not analog_sink then
    print("Could not detect HDMI or analog audio sinks")
    os.exit(1)
end
print("HDMI sink:", hdmi_sink)
print("Analog sink:", analog_sink)

-- Toggle HDMI and set default sink
local active_sink
if hdmi_active then
    print("Turning HDMI off and switching to analog audio...")
    os.execute("xrandr --output " .. hdmi_monitor .. " --off")
    active_sink = analog_sink
else
    print("Turning HDMI on and switching to HDMI audio...")
    os.execute("xrandr --output " .. hdmi_monitor .. " --auto")
    active_sink = hdmi_sink
end

print("Setting default audio sink to:", active_sink)
os.execute("pactl set-default-sink " .. active_sink)

-- Move current audio streams to the active sink
print("Moving current audio streams to the active sink...")
for _, line in ipairs(run_cmd_lines("pactl list short sink-inputs")) do
    local stream_id = line:match("^(%d+)")
    if stream_id then
        print("Moving stream ID", stream_id, "to sink", active_sink)
        os.execute("pactl move-sink-input " .. stream_id .. " " .. active_sink)
    end
end

print("HDMI toggled. Current audio sink:", active_sink)
