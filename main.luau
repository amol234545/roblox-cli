local process = require("@lune/process")
local help = require("help")
local args = process.args
local command = args[1]
local command_args = {}
print(command,command_args)

if args and args[1] ~= "help" then
  for i,v in args do
     if i ~= 1 then
        table.insert(command_args,v)
     end
  end 
else
    help()
end