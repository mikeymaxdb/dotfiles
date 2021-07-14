---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir()

local theme = {}

local col_cyan = "#078c88"
local col_pink = "#9e1671"
local col_blue_dark = "#042542"
local col_wallpaper = "#282828"
local col_white = "#dddddd"

theme.font          = "DejaVuSansMono 9"

theme.bg_normal     = col_wallpaper
theme.bg_focus      = col_pink
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = col_wallpaper

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(2)
theme.border_radius = dpi(6)
theme.border_normal = "#444444"
theme.border_focus  = col_cyan
theme.border_marked = "#91231c"

theme.bg_bar = "#353535"
theme.fg_bar = col_cyan
theme.fg_bar_warning = col_pink

theme.transparent = "#00000000"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = "~/wallpaper"

-- You can use your own layout icons like this:
-- iconmonster.com size:32 pad:6
theme.icon_vol_on = themes_path.."theme/icons/vol_on.png"
theme.icon_vol_mute = themes_path.."theme/icons/vol_mute.png"
theme.icon_vol_off = themes_path.."theme/icons/vol_off.png"

theme.icon_wifi = themes_path.."theme/icons/wifi.png"

theme.icon_battery_charging = themes_path.."theme/icons/battery_charging.png"
theme.icon_battery_full = themes_path.."theme/icons/battery_full.png"
theme.icon_battery_half = themes_path.."theme/icons/battery_half.png"
theme.icon_battery_empty = themes_path.."theme/icons/battery_empty.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
