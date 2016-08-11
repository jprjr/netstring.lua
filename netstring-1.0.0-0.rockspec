package = "netstring"
version = "1.0.0-0"
source = {
    url = "git://github.com/jprjr/netstring.lua",
    tag = "1.0.0"
}
description = {
    summary = "Implementation of DBJ's netstring for lua",
    homepage = "https://github.com/jprjr/netstring.lua",
    license = "MIT"
}
build = {
    type = "builtin",
    modules = {
        netstring = "netstring.lua"
    }
}
dependencies = {
    "lua >= 5.1"
}
