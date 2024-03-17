local log = require("./log")
local commands = {
	"login",
	"logout",
	"upload",
	"list",
	"install",
	"uninstall",
	"search",
}

return function()
	log.color("bloxPackage", "green")
	log.color("A package manager for Roblox.", "cyan")
	print("Commands:")
	for _, v in commands do
		log.color(v, "blue")
	end
end
