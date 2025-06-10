function Register()
    return "48 8D ? ? ? ? ? B9 20 00 00 00 0F 1F 40 00 66 0F 1F 84 00 00 00 00 00 48 89 10 48 89 50 08 48 89 50 10 48 8D 40 40 48 89 50 D8 48 89 50 E0 48 89 50 E8 48 89 50 F0 48 89 50 F8 48 83 E9 01"
end

function OnMatchFound(MatchAddress)
    local LeaInstr = MatchAddress
    local NextInstr = LeaInstr + 0x7
    local Offset = LeaInstr + 0x3
    local AddressLoaded = NextInstr + DerefToInt32(Offset)
    return AddressLoaded
end