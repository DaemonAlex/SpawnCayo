Citizen.CreateThread(function()
    local cayoPericoCoords = vector3(4840.571, -5174.425, 2.0)
    local loadDistance = 2000.0
    local isLoaded = false

    while true do
        Citizen.Wait(10000)

        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - cayoPericoCoords)

        if distance < loadDistance and not isLoaded then
            SetScenarioGroupEnabled('Heist_Island_Peds', true)
            RequestIpl("h4_islandairstrip")
            RequestIpl("h4_islandx_mansion")
            RequestIpl("h4_islandx_maindock")
            isLoaded = true
        elseif distance >= loadDistance and isLoaded then
            SetScenarioGroupEnabled('Heist_Island_Peds', false)
            RemoveIpl("h4_islandairstrip")
            RemoveIpl("h4_islandx_mansion")
            RemoveIpl("h4_islandx_maindock")
            isLoaded = false
        end
    end
end)
