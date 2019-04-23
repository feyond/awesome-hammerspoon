local function Chinese()
    hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
end

local function English()
    hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end


local function set_app_input_method(app_name, set_input_method_function, event)
  hs.window.filter.new(app_name)
    :subscribe({hs.window.filter.windowFocused, hs.window.filter.windowCreated}, function()
                 set_input_method_function()
              end)
end

set_app_input_method('Safari 浏览器', English)
set_app_input_method('Sublime Text', English)
set_app_input_method('Alfred 3', English)
set_app_input_method('1Password 7', English)
set_app_input_method('Hammerspoon', English)
set_app_input_method('聚焦', English)
set_app_input_method('Paw', English)
set_app_input_method('iTerm2', English)
set_app_input_method('Google Chrome', English)
set_app_input_method('微信', Chinese)
set_app_input_method('Telegram', Chinese)
set_app_input_method('QQ', Chinese)
set_app_input_method('访达', Chinese)

-- helper hotkey to figure out the app path and name of current focused window
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
    hs.alert.show("App path:        "
    ..hs.window.focusedWindow():application():path()
    .."\n"
    .."App name:      "
    ..hs.window.focusedWindow():application():name()
    .."\n"
    .."IM source id:  "
    ..hs.keycodes.currentSourceID())
end)

