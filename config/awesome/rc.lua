local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local widgets = require("widgets")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({
            preset = naughty.config.presets.critical,
            title = "There were errors during startup",
            text = awesome.startup_errors
        })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
                preset = naughty.config.presets.critical,
                title = "An error occurred",
                text = tostring(err)
            })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

terminal = "urxvt"
browser = "firefox"
modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral.dwindle,
}
-- }}}

-- {{{ Wibar
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ }, 3, awful.tag.viewtoggle)
    )

local function set_wallpaper(s)
    if beautiful.wallpaper then
        gears.wallpaper.maximized(beautiful.wallpaper, s, false)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.noempty,
        buttons = taglist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, bg = "#00000000" })
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            widgets.networkIcon,
            widgets.network,
            widgets.separator,
            widgets.volumeIcon,
            widgets.volume,
            widgets.separator,
            widgets.battery,
            widgets.separator,
            widgets.clock,
        },
    }
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    -- Awesome
    awful.key({ modkey              }, "s", hotkeys_popup.show_help, {description = "show help", group="awesome"}),
    awful.key({ modkey, "Control"   }, "r", awesome.restart,         {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"     }, "q", awesome.quit,            {description = "quit awesome", group = "awesome"}),

    -- Applications
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,               {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey }, "i", function () awful.spawn(browser) end,                     {description = "start browser", group = "launcher"}),
    awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end, {description = "run prompt", group = "launcher"}),
    awful.key({ modkey }, "p", function() menubar.show() end,                            {description = "show the menubar", group = "launcher"}),
    awful.key({ modkey }, "b", function ()
        local mywibox = awful.screen.focused().mywibox
        mywibox.visible = not mywibox.visible
    end, {description = "hide menubar", group = "launcher"}),

    -- Tag Navigation
    awful.key({ modkey }, "Left", awful.tag.viewprev,          {description = "view previous tag", group = "tag"}),
    awful.key({ modkey }, "Right", awful.tag.viewnext,         {description = "view next tag", group = "tag"}),
    awful.key({ modkey }, "Escape", awful.tag.history.restore, {description = "view last tag", group = "tag"}),

    -- Client Navigation
    awful.key({ modkey          }, "j", function () awful.client.focus.byidx( 1) end, {description = "focus next client by index", group = "client"}),
    awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx(  1) end, {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey          }, "k", function () awful.client.focus.byidx(-1) end, {description = "focus previous client by index", group = "client"}),
    awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx( -1) end, {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey          }, "u", awful.client.urgent.jumpto,                   {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey          }, "Tab", function ()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end, {description = "focus last client", group = "client"}),

    -- Screen navigation
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end, {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),

    -- Layout
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1) end,                {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1) end,                {description = "select previous", group = "layout"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05) end,          {description = "increase main width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05) end,          {description = "decrease main width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end, {description = "increase the number of main clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of main clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true) end,    {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true) end,    {description = "decrease the number of columns", group = "layout"}),

    -- System
    awful.key({}, "XF86AudioRaiseVolume", function ()
        awful.spawn("pactl set-sink-volume " .. audioDeviceName .. " +5%")
        volumeTimer:emit_signal("timeout")
    end),

    awful.key({}, "XF86AudioLowerVolume", function ()
        awful.spawn("pactl set-sink-volume " .. audioDeviceName .. " -5%")
        volumeTimer:emit_signal("timeout")
    end),

    awful.key({}, "XF86AudioMute", function ()
        awful.spawn("pactl set-sink-mute " .. audioDeviceName .. " toggle")
        muteTimer:emit_signal("timeout")
    end)
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen c:raise() end, {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "f",      awful.client.floating.toggle,                               {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill() end,                                  {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,          {description = "move to main", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen() end,                        {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop end,                     {description = "toggle keep on top", group = "client"})
)

-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            size_hints_honor = false,
        }
    },

    -- Floating clients.
    { rule_any = {
        instance = {},
        class = {},
        name = {
          "Event Tester",  -- xev.
        },
        role = {}
      }, properties = { floating = true }},
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set new windows as secondary
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    -- Rounded corners
    c.shape = function(cr,w,h)
        gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, beautiful.border_radius)
    end
end)

-- Focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
