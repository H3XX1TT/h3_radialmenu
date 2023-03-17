fx_version 'cerulean'

lua54 'yes'

author 'H3XX1TT#0869'
description 'h3_radialmenu (opensource) Free to Use discord: https://discord.gg/th8a6N8Jpc'

client_scripts{
    "client/*.lua"
}

server_scripts{
    "server/*.lua"
}

shared_scripts{
    '@es_extended/imports.lua'
    "shared/config.lua",
    "shared/rootMenu.lua",
    "shared/subMenu.lua"
}

ui_page "html/ui.html"

files{
    "html/*.html",
    "html/css/*.css",
    "html/js/*.js",
    "html/webfonts/*.eot",
    "html/webfonts/*.svg",
    "html/webfonts/*.ttf",
    "html/webfonts/*.woff",
    "html/webfonts/*.woff2"
    "html/img/*.jpg",
    "html/img/*.png"
}

dependencies{
    'es_extended',
    'esx_billing'
}