--Menü State
local MenuShow = false

local KeyBindControlList = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164,
    ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303,
    ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73,
    ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11,
    ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local Max_Menu_Items = 6

Citizen.CreateThread(function()
    local keybind = "F1"
    while true do
        Citizen.Wait(0)
        if IsControlPressed(1, KeyBindControlList[keybind]) and GetLastInputMethod(2) and MenuShow then
            print("false")
            MenuShow = false
            SetNuiFocus(false, false)
        end
        if IsControlPressed(1, KeyBindControlList[keybind]) and GetLastInputMethod(2) then
            print("true")
            MenuShow = true
            local enableMenu = {}
            for k, v in ipairs(rootMenu) do
                if v:enableMenu() then
                    local dataElements = {}
                    local hasSubMenus = false
                    if v.subMenus ~= nil and #v.subMenus > 0 then
                        hasSubMenus = true
                        local vorherigesMenu = dataElements
                        local aktuellesMenu = {}
                        for i = 1, #v.subMenus do
                            aktuellesMenu[#aktuellesMenu + 1] = neueSubMenus[v.subMenus[i]]
                            aktuellesMenu[#aktuellesMenu].id = v.subMenus[i]
                            aktuellesMenu[#aktuellesMenu].enableMenu = nil

                            if i % Max_Menu_Items == 0 and i < (#v.subMenus - 1) then
                                vorherigesMenu[Max_Menu_Items + 1] = {
                                    id          = "_more",
                                    title       = "Weiter",
                                    icon        = "#more",
                                    items       = aktuellesMenu
                                }
                                vorherigesMenu = aktuellesMenu
                                aktuellesMenu = {}
                            end
                        end

                        if #aktuellesMenu > 0 then
                            vorherigesMenu[Max_Menu_Items + 1] = {
                                id              = "_more",
                                title           = "Weiter",
                                icon            = "#more",
                                items           = aktuellesMenu
                            }
                        end
                        dataElements = dataElements[Max_Menu_Items + 1].items
                    end
                    enableMenu[#enableMenu + 1] = {
                        id                      = v.id,
                        title                   = v.displayName
                        functionName            = v.functionName
                        icon                    = v.icon
                    }
                    if hasSubMenus then
                        enableMenu[#enableMenu].items = dataElements
                    end
                end
            end
            SendNUIMessage({
                state = "show"
                resourceName = GetCurrentResourceName(),
                data = enableMenu,
                menuKeyBind = keybind
            })
            SetCursorLocation(0.5, 0.5)
            SetNuiFocus(true, true)
            PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", true)

            while MenuShow == true do
                Citizen.Wait(100)
            end
            Citizen.Wait(100)
            while IsControlPressed(1, KeyBindControlList[keybind]) and GetLastInputMethod(2) do
                Citizen.Wait(100)
            end
        end
    end
end)

RegisterCommand("radialfix", function()
    MenuShow = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
end)

--Callback function zum schließen des Menüs
RegisterNUICallback('closemenu', function(data,cb)
    --Setzte den Focus zurück und zerstöre das UI
    MenuShow = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", true)
    cb('ok')
end)

--Callback funktion wenn ein Item gedrückt wird, --> BEFEHL AUSFÜHREN

RegisterNUICallback('triggerAction', function(data, cb)
    MenuShow = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", true)
    TriggerEvent(data.action, data.parameters)
    cb('ok')
end)

RegisterNetEvent("h3_coding:radialmenu")
AddEventHandler("h3_coding:radialmenu", function()
    MenuShow = false
    SetNuiFocus(false, false)
end)