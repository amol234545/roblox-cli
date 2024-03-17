local process = require("@lune/process")
local task = require("@lune/task")
local fs = require("@lune/fs")
local path = require("path")
local net = require("@lune/net")
local scopes = "read:user"
function oauth()
	local authed = false
	local code = ""
	process.spawn("start", {
		`https://github.com/login/oauth/authorize?client_id=d26169eca64277da9b66\"&\"scope=${scopes}\"&\"allow_signup=true`,
	}, { shell = true })
	local s = net.serve(3008, function(h)
		if h.path ~= "/favicon.ico" then
			authed = true
			code = h.query["code"]
		end
		return {
			status = 200,
			body = "You are logged in!",
		}
	end)
	repeat
		task.wait(1)
	until authed
	s.stop()
	process.spawn("taskkill", {
		"/f",
		"/im",
		"chrome.exe",
	}, { shell = true })
	local jsonr = net.jsonDecode(net.request({
		url = "https://github.com/login/oauth/access_token",
		headers = {
			["Content-Type"] = "application/json",
			["Accept"] = "application/json",
			["User-Agent"] = _VERSION,
		},
		body = net.jsonEncode({
			["client_id"] = "d26169eca64277da9b66",
			["client_secret"] = "8ad90074de24c8a1d1cb2b5b4ffc9a621f34ef6f",
			["code"] = code,
		}),
	}).body)
	local data = net.request({
		url = "https://api.github.com/user",
		headers = {
			["Content-Type"] = "application/json",
			["Accept"] = "application/json",
			["User-Agent"] = _VERSION,
			["Authorization"] = "Bearer " .. jsonr["access_token"],
			["X-GitHub-Api-Version"] = "2022-11-28",
		},
	})
	local a = net.jsonDecode(data.body)
	a["login_token"] = jsonr["access_token"]
	fs.writeFile(path .. "/github_login_data.txt", net.jsonEncode(a))
end
return function()
	oauth()
end
