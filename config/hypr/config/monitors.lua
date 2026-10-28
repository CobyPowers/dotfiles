local INTEGRATED_MONITOR_DESC = "BOE 0x0BC7"
local EXTERNAL_MONITOR_DESC = "Samsung Electric Company LC32G5xT HNTT100754"

-- Any Monitor
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- Disable integrated monitor if a specific external one is attached
local function toggle_integrated_monitor(m)
	local external_monitor = hl.get_monitor("desc:" .. EXTERNAL_MONITOR_DESC)
	if m == nil or m.description == EXTERNAL_MONITOR_DESC then
		hl.monitor({
			output = "desc:" .. INTEGRATED_MONITOR_DESC,
			mode = "2560x1600@60",
			position = "auto",
			scale = "1.67",
			disabled = external_monitor ~= nil,
		})
	end
end

toggle_integrated_monitor()
hl.on("monitor.added", toggle_integrated_monitor)
hl.on("monitor.removed", toggle_integrated_monitor)
