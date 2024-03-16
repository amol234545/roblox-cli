local process = require("@lune/process")
local args = process.args
local command = args[1]
print(args)
local command_args = {}

for i,v in args do
   if i ~= 1 then
      table.insert(command_args,v)
   end
end 
print(command)
if command == "help" then 
   require("modules/help")(); process.exit(0) 
elseif command == "login" then 
   require("modules/login")()
end


