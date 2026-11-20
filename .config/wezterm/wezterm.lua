local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font('Hack Nerd Font', {
  weight = 'Regular',
  stretch = 'Normal',
  style = 'Normal',
})
config.font_size = 12
config.warn_about_missing_glyphs = false
config.line_height = 1.05
config.detect_password_input = false

-- Window
config.window_background_opacity = 0.5
config.window_decorations = 'NONE'
config.window_padding = { left = 12, right = 12, top = 8, bottom = 8 }
config.adjust_window_size_when_changing_font_size = false
config.hide_mouse_cursor_when_typing = true
config.window_close_confirmation = 'NeverPrompt'

-- Cursor
config.cursor_blink_rate = 500
config.default_cursor_style = 'BlinkingBar'

-- Tabs
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.tab_max_width = 32
config.use_fancy_tab_bar = false

local BAR = '#1f2335'
local CAP_L = '\u{e0b6}'
local CAP_R = '\u{e0b4}'

local PILL = {
  active   = { bg = '#7aa2f7', fg = '#16161e', bold = true },
  inactive = { bg = '#292e42', fg = '#7f8ab8', bold = false },
  hover    = { bg = '#3b4261', fg = '#c0caf5', bold = false },
}

wezterm.on('format-tab-title', function(tab, tabs, panes, cfg, hover, max_width)
  local title = tab.tab_title
  if title == nil or #title == 0 then
    local pane = tab.active_pane
    title = (pane and pane.title) or ''
  end

  local p
  if tab.is_active then
    p = PILL.active
  elseif hover == true or hover == 1 or hover == 'Hover' then
    p = PILL.hover
  else
    p = PILL.inactive
  end

  local room = max_width - 4
  if room < 1 then room = 1 end
  title = wezterm.truncate_right(title, room)

  return {
    { Background = { Color = BAR } },
    { Foreground = { Color = p.bg } },
    { Text = CAP_L },
    { Background = { Color = p.bg } },
    { Foreground = { Color = p.fg } },
    { Attribute = { Intensity = p.bold and 'Bold' or 'Normal' } },
    { Text = ' ' .. title .. ' ' },
    { Background = { Color = BAR } },
    { Foreground = { Color = p.bg } },
    { Text = CAP_R },
    { Attribute = { Intensity = 'Normal' } },
    { Background = { Color = BAR } },
    { Foreground = { Color = BAR } },
    { Text = ' ' },
  }
end)

-- Colors
config.colors = {
  foreground = '#c0caf5',
  background = '#1f2335',

  cursor_bg = '#7aa2f7',
  cursor_border = '#7aa2f7',
  cursor_fg = '#1a1b26',

  selection_bg = '#bb9af7',
  selection_fg = '#1a1b26',

  ansi = {
    '#24283b',
    '#ff7198',
    '#7af78c',
    '#fff871',
    '#5c89ea',
    '#7dcfff',
    '#7aa2f7',
    '#eff9ff',
  },

  brights = {
    '#565c5f',
    '#ff9eb9',
    '#a4ffb2',
    '#fffaa4',
    '#91b4ff',
    '#a4c1ff',
    '#c4d7ff',
    '#f8fcff',
  },

  tab_bar = {
    background = BAR,
    new_tab = { bg_color = BAR, fg_color = '#565f89' },
    new_tab_hover = { bg_color = '#3b4261', fg_color = '#c0caf5' },
  },
}

-- Scrollback
config.scrollback_lines = 10000
config.enable_scroll_bar = false

-- Selection
config.selection_word_boundary = " \t\n\r!\"$'()*,;:<>[\\]^`{|}"

-- Mouse wheel
local WHEEL_LINES = 4
config.alternate_buffer_wheel_scroll_speed = 3

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'NONE',
    alt_screen = false,
    action = wezterm.action.ScrollByLine(-WHEEL_LINES),
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'NONE',
    alt_screen = false,
    action = wezterm.action.ScrollByLine(WHEEL_LINES),
  },
}

-- Rendering
config.front_end = 'WebGpu'
config.max_fps = 60
config.animation_fps = 30
config.webgpu_power_preference = 'LowPower'
config.exit_behavior = 'Close'
config.status_update_interval = 1000

-- Keys
config.keys = {
  { key = 't', mods = 'ALT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentTab { confirm = false } },

  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },

  { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },

  { key = 'F5', mods = 'CTRL|SHIFT', action = wezterm.action.ReloadConfiguration },
}

config.enable_kitty_keyboard = true
config.disable_default_key_bindings = false
config.use_dead_keys = false

-- Hosts
local ok, local_config = pcall(dofile, wezterm.config_dir .. '/local.lua')
if ok and type(local_config) == 'table' then
  for key, value in pairs(local_config) do
    config[key] = value
  end
end

return config
