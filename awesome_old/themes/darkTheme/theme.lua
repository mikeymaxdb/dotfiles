---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "Open Sans Light 8"

theme.bg_normal     = "#28282800"
theme.bg_focus      = "#28282800"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#bbbbbb50"

theme.fg_normal     = "#ffffff" 
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "3"
theme.border_normal = "#4e4e4e"
theme.border_focus  = "#bbbbbb"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
theme.taglist_bg_focus = "#ffffff"
theme.taglist_fg_focus = "#28282800"

-- Display the taglist squares
theme.taglist_squares_sel   = "~/.config/awesome/themes/darkTheme/taglist/squaref.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/darkTheme/taglist/squarefw.png"

theme.tasklist_floating_icon = "~/.config/awesome/themes/darkTheme/tasklist/floating.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "~/.config/awesome/themes/darkTheme/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "150"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = ("awsetbg -a /home/mike/.config/awesome/themes/darkTheme/wallpaper/glados_nowords_gradient.png")

-- You can use your own layout icons like this:
theme.layout_fairh = "~/.config/awesome/themes/darkTheme/layouts/fairhw.png"
theme.layout_fairv = "~/.config/awesome/themes/darkTheme/layouts/fairvw.png"
theme.layout_floating  = "~/.config/awesome/themes/darkTheme/layouts/floatingw.png"
theme.layout_magnifier = "~/.config/awesome/themes/darkTheme/layouts/magnifierw.png"
theme.layout_max = "~/.config/awesome/themes/darkTheme/layouts/maxw.png"
theme.layout_fullscreen = "~/.config/awesome/themes/darkTheme/layouts/fullscreenw.png"
theme.layout_tilebottom = "~/.config/awesome/themes/darkTheme/layouts/tilebottomw.png"
theme.layout_tileleft   = "~/.config/awesome/themes/darkTheme/layouts/tileleftw.png"
theme.layout_tile = "~/.config/awesome/themes/darkTheme/layouts/tilew.png"
theme.layout_tiletop = "~/.config/awesome/themes/darkTheme/layouts/tiletopw.png"
theme.layout_spiral  = "~/.config/awesome/themes/darkTheme/layouts/spiralw.png"
theme.layout_dwindle = "~/.config/awesome/themes/darkTheme/layouts/dwindlew.png"

theme.awesome_icon = "~/.config/awesome/themes/darkTheme/awesome16.png"

return theme
