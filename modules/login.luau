local process = require("@lune/process")
local GITHUB_LOGIN_PATH = process.cwd.."\\login.txt"
local task, net = require("@lune/task"), require("@lune/net")
return function() 
    local response = net.request({
        url = "https://github.com/login/device/code",
        method = "POST",
        headers = { ["Accept"] = "application/json" },
        body = net.jsonEncode({
            ["client_id"] = "d26169eca64277da9b66",
            ["scope"] = "read:user"
        })
    })
    local json = net.jsonDecode(response)
end