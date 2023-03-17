RegisterNetEvent("roadphone:openphone")
AddEventHandler("roadphone:openphone", function()
    exports['roadphone']:togglePhone()
end)