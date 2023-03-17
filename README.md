# h3_radialmenu
 Fivem RadialMenu


# Insert in scripts!!! ##
# ################################## #
## esx_billing --> client --> main.lua ##
```lua
RegisterNetEvent("esx_billing:showBilling")
AddEventHandler("esx_billing:showBilling", function()
	if not isDead then
		ShowBillsMenu()
	end
end)
```

## CarryPeople --> cl_carry.lua ##
## Download: Comming Soon...
```lua
RegisterNetEvent("h3_coding:radial:tragen")
AddEventHandler("h3_coding:radial:tragen", function()
	if not carry.InProgress then
		local closestPlayer = GetClosestPlayer(3)
		if closestPlayer then
			local targetSrc = GetPlayerServerId(closestPlayer)
			if targetSrc ~= -1 then
				carry.InProgress = true
				carry.targetSrc = targetSrc
				TriggerServerEvent("CarryPeople:sync",targetSrc)
				ensureAnimDict(carry.personCarrying.animDict)
				carry.type = "carrying"
			else
				drawNativeNotification("~r~No one nearby to carry!")
			end
		else
			drawNativeNotification("~r~No one nearby to carry!")
		end
	else
		carry.InProgress = false
		ClearPedSecondaryTask(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	end
end)
```