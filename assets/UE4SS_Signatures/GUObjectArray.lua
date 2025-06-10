function Register()
    return "89 05 ?? ?? ?? ?? 85 DB 7F 36 4C 8D 05 ?? ?? ?? ?? "
end

function OnMatchFound(matchAddress)
    local displacement = DerefToInt32(matchAddress+2)
    local rip = matchAddress + 4 + 2
    return rip + displacement
end