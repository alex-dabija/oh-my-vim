local Terminal = require('extensions.tbuild.terminal')
local Window = require('extensions.tbuild.window')
local DefaultTerminal = Terminal:new(Window:new())

return {
  Terminal = Terminal,
  Window = Window,
  DefaultTerminal = DefaultTerminal,
}
