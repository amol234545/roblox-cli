local process = require("@lune/process")\
local task = require("@lune/task")
local authed = false
local net =  require("@lune/net")
local scopes = "read:user"
return function()
    local redirect_uri = net.urlEncode("http://127.0.0.1:3008")
   process.spawn("spawn",{
    `https://github.com/login/oauth/authorize?client_id=d26169eca64277da9b66&scope=${scopes}&redirect_uri=${redirect_uri}`
   },{shell=true})
   local s = net.serve(3008, function(h)
    print(h)
    authed = true
   end)
   repeat task.wait(1) until authed
   s.stop()
end