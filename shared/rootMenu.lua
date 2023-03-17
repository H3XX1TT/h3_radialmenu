if Config["NewESX"] then
    ESX = exports["es_extended"]:getSharedObject()
else
    ESX = nil
    Citizen.Wait(0)
end

rootMenu = {
    {
        id          = "general",
        displayName = "Allgmein",
        icon        = "#globe-europe",
        enableMenu = function()
            return(not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = {
            "general:emotes",
            "general:geiselnehmen",
            "general:givekeys",
            "general:phone",
            "general:rechnung",
            "general:tragen"
        }
    }
}