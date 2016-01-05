local modal = hs.hotkey.modal.new({'ctrl'}, '\'')
local log = hs.logger

local padding = 5
local modalBox
local primaryScreen = hs.screen.primaryScreen()

hs.alert.show("Config loaded")

function modal:entered()
  currentScreen = hs.screen.mainScreen():fullFrame()
  modalBox = hs.drawing.rectangle(currentScreen)
  modalBox:setStroke(true):setFill(false)
  modalBox:setStrokeColor(hs.drawing.color.osx_yellow)
  modalBox:setStrokeWidth(padding)
  modalBox:show()
end
function modal:exited()
  if modalBox then
    modalBox:delete()
  end
end

modal:bind({}, 'escape', function()
  focusMouse()
  modal:exit()
end)

modal:bind({}, 'r', hs.reload)

function kwmc(command)
  local kwmcPath = '/Users/morales/.bin/kwmc'
  hs.task.new(kwmcPath, nil, command):start()
end

modal:bind({'shift'}, 'r', function()
  kwmc({'space', '-r', '180'})
end)

modal:bind({'shift'}, 'f', function()
 kwmc({'window', '-t', 'fullscreen'})
end)

modal:bind({}, 'n', function()
  kwmc({'window', '-s', 'next'})
end)

modal:bind({}, 'p', function()
  kwmc({'window', '-s', 'prev'})
end)

modal:bind({'shift'}, 'n', function()
  kwmc({'screen', '-m', 'next'})
end)

modal:bind({'shift'}, 'p', function()
  kwmc({'screen', '-m', 'prev'})
end)

modal:bind({}, 'h', function()
  hs.window.focusWindowWest()
  focusMouse()
  modal:exit()
end)
modal:bind({}, 'l', function()
  hs.window.focusWindowEast()
  focusMouse()
  modal:exit()
end)
modal:bind({}, 'j', function()
  hs.window.focusWindowSouth()
  focusMouse()
  modal:exit()
end)
modal:bind({}, 'k', function()
  hs.window.focusWindowNorth()
  focusMouse()
  modal:exit()
end)

modal:bind({}, '1', function()
  hs.window.focusedWindow():moveToScreen(hs.screen.primaryScreen():next())
end)

modal:bind({}, '2', function()
  hs.window.focusedWindow():moveToScreen(hs.screen.primaryScreen())
end)

function focusMouse()
  local win = hs.window.focusedWindow()
  if win == nil then return end

  local frame = win:frame()
  local x = frame.x + frame.w / 2
  local y = frame.y + frame.h - 20

  hs.mouse.setAbsolutePosition(hs.geometry.point(x, y))
  kwmc({'window', '-f', 'curr'})
end

border = nil

function drawBorder()
    if border then
        border:delete()
    end

    local win = hs.window.focusedWindow()
    if win == nil then return end

    local f = win:frame()
    local fx = f.x - 2
    local fy = f.y - 2
    local fw = f.w + 4
    local fh = f.h + 4

    border = hs.drawing.rectangle(hs.geometry.rect(fx, fy, fw, fh))
    border:setStrokeWidth(3)
    border:setStrokeColor({["red"]=0.75,["blue"]=0.14,["green"]=0.83,["alpha"]=0.80})
    border:setRoundedRectRadii(5.0, 5.0)
    border:setStroke(true):setFill(false)
    border:setLevel("normal")
    border:show()
end

function windowActions()
  drawBorder()
  focusMouse()
end

windowActions()
focusMouse()
kwmc({'quit'})

windows = hs.window.filter.new(nil)
windows:subscribe(hs.window.filter.windowFocused, function () drawBorder() end)
windows:subscribe(hs.window.filter.windowUnfocused, function () drawBorder() end)
windows:subscribe(hs.window.filter.windowMoved, function () drawBorder() end)
