local modal = hs.hotkey.modal.new({'ctrl'}, '\'')

modalBox = nil

hs.alert.show("Config loaded")

function modal:entered()
  currentScreen = hs.screen.mainScreen():fullFrame()
  modalBox = hs.drawing.rectangle(currentScreen)
  modalBox:setStroke(true):setFill(false)
  modalBox:setStrokeColor(hs.drawing.color.osx_yellow):setStrokeWidth(5)
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

function kwmcCommand(command)
  local kwmcPath = '/Users/morales/.bin/kwmc'
  hs.task.new(kwmcPath, nil, command):start()
end

function kwmc(command, shouldExit)
  shouldExit = shouldExit or false
  function closure()
    kwmcCommand(command)
    if shouldExit then modal:exit() end
  end
  return closure
end

modal:bind({}, 'r', hs.reload)
modal:bind({}, 'n', kwmc({'window', '-f', 'next'}))
modal:bind({}, 'p', kwmc({'window', '-f', 'prev'}))
modal:bind({}, '1', kwmc({'screen', '-m', 'next'}))
modal:bind({}, '2', kwmc({'screen', '-m', 'prev'}))
modal:bind({}, 'h', kwmc({'window', '-f', 'prev'}))
modal:bind({}, 'j', kwmc({'window', '-f', 'prev'}))
modal:bind({}, 'k', kwmc({'window', '-f', 'next'}))
modal:bind({}, 'l', kwmc({'window', '-f', 'next'}))

modal:bind({'shift'}, 'h', kwmc({'screen', '-f', 'prev'}, true))
modal:bind({'shift'}, 'j', kwmc({'window', '-s', 'next'}))
modal:bind({'shift'}, 'k', kwmc({'window', '-s', 'prev'}))
modal:bind({'shift'}, 'l', kwmc({'screen', '-f', 'next'}, true))


modal:bind({'shift'}, 'r', kwmc({'tree', '-r', '180'}))
modal:bind({'shift'}, 'f', kwmc({'window', '-t', 'fullscreen'}))
modal:bind({'shift'}, 'n', kwmc({'window', '-s', 'next'}))
modal:bind({'shift'}, 'p', kwmc({'window', '-s', 'prev'}))

function focusMouse()
  local win = hs.window.focusedWindow()
  if win == nil then return end

  local frame = win:frame()
  local x = frame.x + frame.w / 2
  local y = frame.y + frame.h - 20

  hs.mouse.setAbsolutePosition(hs.geometry.point(x, y))
  kwmcCommand({'window', '-f', 'curr'})
end

kwmcCommand({'quit'})
