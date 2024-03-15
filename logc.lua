local stdio = require("@lune/stdio")
function logc(message : string | any, color: "black" | "blue" | "cyan" | "green" | "purple" | "red"  | "white" | "yellow")
    stdio.write(stdio.color(color))
    print(message)
    stdio.write(stdio.color("reset"))
end
return logc