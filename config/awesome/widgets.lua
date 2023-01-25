local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

sep=' • '

local widgets = {}
widgets.separator = wibox.widget.textbox(sep)

-------------------------

local clock = wibox.widget.textclock("%a %b %d %I:%M ")
local calendar = awful.widget.calendar_popup.month({
        start_sunday = true,
        long_weekdays = true,
        week_numbers = true,
        style_weeknumber = {
            border_width = 0
        }
    })
calendar:attach(clock, "tr", {
        on_hover = false
    })
widgets.clock = clock

-------------------------

local audioDeviceName = "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink"
local volumeCommand = "pacmd list-sinks | grep -A 6 " .. audioDeviceName .. " | grep volume | cut -d '/' -f 2 | cut -d % -f 1"
local muteCommand = "amixer sget Master | grep Mono: | awk '{print $(NF)}'"
local volumeIcon= wibox.widget {
    resize = true,
    widget = wibox.widget.imagebox,
}
local volumeWidget, volumeTimer = awful.widget.watch({ awful.util.shell, "-c", volumeCommand }, 30, function(widget, stdout)
    widget:set_text(" " .. tonumber(stdout or "") .. "%")
end)
local muteWidget, muteTimer = awful.widget.watch({ awful.util.shell, "-c", muteCommand }, 30, function(widget, stdout)
    if (stdout == "[off]\n") then volumeIcon:set_image(beautiful.icon_vol_mute)
    else volumeIcon:set_image(beautiful.icon_vol_on)
    end
end)
widgets.volumeIcon = volumeIcon
widgets.volumeTimer = volumeTimer
widgets.muteTimer = muteTimer
widgets.volume = volumeWidget

-------------------------

local networkIcon= wibox.widget {
    image = beautiful.icon_wifi,
    resize = true,
    widget = wibox.widget.imagebox,
}
local networkWidget = awful.widget.watch({ awful.util.shell, "-c", "nmcli -t -f name connection show --active" }, 30, function(widget, stdout)
        widget:set_text(stdout)
end)
widgets.networkIcon = networkIcon
widgets.network = networkWidget

-------------------------

local batteryBar = wibox.widget {
    max_value = 100,
    forced_height = dpi(20),
    margins = {
        top = dpi(6),
        bottom = dpi(6),
    },
    forced_width = dpi(50),
    shape = gears.shape.rounded_bar,
    bar_shape = gears.shape.rounded_bar,
    color = beautiful.fg_bar,
    background_color = beautiful.bg_bar,
    border_width = dpi(2),
    border_color = beautiful.bg_bar,
    widget = wibox.widget.progressbar
}
local batteryWatcher = awful.widget.watch({ awful.util.shell, "-c", "acpi -b | cut -d ' ' -f 4 | cut -d % -f 1 | head -n 1" }, 30, function(widget, stdout)
    local percent = tonumber(stdout)
    local batteryLevel

    if (percent > 25) then batteryBar.color = beautiful.fg_bar
    else batteryBar.color = beautiful.fg_bar_warning
    end

    batteryBar.value = percent
    widget:set_text(" " .. percent .. "%")
end)
local batteryWidget = wibox.widget {
    nil,
    {
        batteryBar,
        batteryWatcher,
        layout = wibox.layout.fixed.horizontal
    },
    layout = wibox.layout.align.horizontal
}
widgets.battery = batteryWidget


return widgets
