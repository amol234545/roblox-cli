local stdio = require("@lune/stdio")
function color(message : string | any, color: "black" | "blue" | "cyan" | "green" | "purple" | "red"  | "white" | "yellow")
    stdio.write(stdio.color(color))
    print(message)
    stdio.write(stdio.color("reset"))
end
function style(message : string | any,style: "bold" | "dim")
    stdio.style(style)
    print(message)
    stdio.style("reset")
end

return {
    color = color,
    style = style,
}