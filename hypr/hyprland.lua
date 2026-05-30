------------------
----    Lua   ----
-----------------

------------------
---- Monitors ----
------------------

hl.monitor({ output = "DP-1", mode = "1920x1080@180", position = "-1080x-250", scale = 1, transform = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@180", position = "0x0", scale = 1, transform = 0 })


------------------
---- Autostart ---
------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlauncher -d") -- appmanager
    hl.exec_cmd("waybar") --waybar
    hl.exec_cmd("hyprpaper") -- wallpaper
end)


-----------------
----WorkSpace----
-----------------

-- Задаём жесткую сетку: столы созданы сразу, но дальше 8 и 10 уйти нельзя
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

hl.bind("SUPER + W", hl.dsp.exec_cmd("firefox")) -- browser

hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin")) -- file manager

hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty")) -- terminal

hl.bind("SUPER + Q", hl.dsp.window.close()) -- close window

hl.bind("SUPER + Super_L", hl.dsp.exec_cmd("hyprlauncher"), { release = true }) --AppManager

hl.bind("SUPER + F", hl.dsp.window.fullscreen()) -- fullscreen
-- Переключение фокуса МЕЖДУ МОНИТОРАМИ (вместо сломанного m-1 / m+1)
-- Замени те самые два сломанных цикла на эти две строчки:

-- Относительное переключение воркспейсов в рамках текущего монитора (M-1 и M+1)
hl.bind("CTRL + ALT + Left", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("CTRL + ALT + Right", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy && notify-send 'Скриншот области' 'Сохранено в буфер обмена'"))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind("CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true })


------------------
----   Input  ----
------------------

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:win_space_toggle"
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
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
