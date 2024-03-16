local process = require("@lune/process")
local args = process.args
local command = args[1]
local command_args = {}

for i,v in args do
   if i ~= 1 then
      table.insert(command_args,v)
   end
end 

if command == "help" or "?" then require("modules/help")(); process.exit(0) end

if command == "login" then require("modules/login")() end

