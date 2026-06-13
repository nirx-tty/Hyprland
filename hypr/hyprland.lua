------------------
----    Lua   ----
-----------------

------------------
---- Monitors ----
------------------

hl.monitor({ output = "DP-1", mode = "1920x1080@180", position = "-1080x-250", scale = 1, transform = 1 }) -- Настройка монитора DP-1
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@180", position = "0x0", scale = 1, transform = 0 }) -- Настройка монитора HDMI-A-1



------------------
---- Autostart ---
------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlauncher -d") -- appmanager
    hl.exec_cmd("waybar") --waybar
    hl.exec_cmd("exec-once = env XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share hyprlauncher -d") -- appmanager для flatpak
    hl.exec_cmd("hyprpaper") -- wallpaper
    hl.exec_cmd("pacman -Syu") -- обновление системы при запуске Hyprland
    hl.exec_cmd("flatpak update") -- обновление flatpak при запуске Hyprland
    hl.exec_cmd("env = XDG_MENU_PREFIX,arch-") -- добавляет приложения из Hyprland в меню приложений
end)



-----------------
----WorkSpace----
-----------------

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", persistent = true })

hl.workspace_rule({ workspace = "9", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "DP-1", persistent = true })

------------------
----   Binds  ----
------------------

hl.bind("SUPER + L", hl.dsp.exec_cmd("/home/nirx/.config/hypr/clock_girls/make_clock.sh && hyprlock")) -- hyprlock

hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser")) -- browser

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeat_key = true, locked = true }) -- управление звуком

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeat_key = true, locked = true }) -- управление звуком

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true }) -- управление звуком

hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin")) -- file manager

hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty")) -- terminal

hl.bind("SUPER + Q", hl.dsp.window.close()) -- close window

hl.bind("SUPER + Super_L", hl.dsp.exec_cmd("hyprlauncher"), { release = true }) --AppManager

hl.bind("SUPER + F", hl.dsp.window.fullscreen()) -- fullscreen

hl.bind("CTRL + ALT + Left", hl.dsp.focus({ workspace = "m-1" })) -- переключение между мониторами

hl.bind("CTRL + ALT + Right", hl.dsp.focus({ workspace = "m+1" })) -- переключение между мониторами

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy && notify-send 'Скриншот области' 'Сохранено в буфер обмена'")) -- скриншот области

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- перетаскивание окна за любую область

hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true }) 


------------------
----   Input  ----
------------------

hl.config({
    input = {
        kb_layout = "us,ru", -- раскладка клавиатуры
        kb_options = "grp:win_space_toggle" -- переключение раскладки клавиатуры
    }
})


------------------------------
---- Красота и не только  ----
------------------------------

hl.config({

    general = {
        gaps_in = 4,
        gaps_out = 10,
        border_size = 2,
    },

  decoration = {
	rounding = 10,

	        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },

},

    animations = {
        enabled = true,
    },


  dwindle = {
      force_split                  = 0,
      preserve_split               = false,
      smart_split                  = false,
      smart_resizing               = true,
      permanent_direction_override = false,
      special_scale_factor         = 1,
      split_width_multiplier       = 1.0,
      use_active_for_splits        = true,
      default_split_ratio          = 1.0,
      split_bias                   = 0,
      precise_mouse_move           = false,
  },
})     


--------------
----Cursor----
--------------
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice") -- Устанавливает тему курсора для Hyprland.

hl.env("HYPRCURSOR_SIZE", "24") -- Устанавливает размер курсора для Hyprland.

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice") -- Устанавливает тему курсора для X11-приложений.

hl.env("XCURSOR_SIZE", "24") -- Устанавливает размер курсора для X11-приложений.
