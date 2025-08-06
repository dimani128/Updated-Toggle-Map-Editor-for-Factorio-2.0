local function setShortcut(player)
  if player.is_shortcut_available('toggle-mapeditor-shortcut') then
    local toggled = player.controller_type == defines.controllers.editor
    player.set_shortcut_toggled('toggle-mapeditor-shortcut', toggled)
  end
end

local function toggledEvent(event)
  local player = game.get_player(event.player_index)
  setShortcut(player)
end

local function toggleME(event)
  local player = game.get_player(event.player_index)
  player.toggle_map_editor()
  setShortcut(player)
end

local function shortcutClicked(event)
  if event.prototype_name == 'toggle-mapeditor-shortcut' then
    toggleME(event)
  end
end

script.on_event('toggle-mapeditor-hotkey', toggleME)
script.on_event(defines.events.on_lua_shortcut, shortcutClicked)
script.on_event(defines.events.on_player_toggled_map_editor, toggledEvent)
