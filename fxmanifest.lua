fx_version 'cerulean'

lua54 'yes'

author 'H3XX1TT#0869'
description 'h3_radialmenu (opensource) Free to Use'

client_scripts{
    "client/*.lua"
}

server_scripts{
    "server/*.lua"
}

shared_scripts{
    '@es_extended/imports.lua'
    "shared/config.lua",
}

ui_page "html/index.html"

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