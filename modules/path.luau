local fs = require("@lune/fs")
local process = require("@lune/process")
local pathr = process
	.spawn("cmd", {
		'/c "echo %homedrive%%homepath%\\.bloxPackage"',
	}, { shell = true }).stdout
	:split("\n")[1]
local path = pathr:sub(1, #pathr - 1)
if not fs.isDir(path) then
	fs.writeDir(path)
end
return path
