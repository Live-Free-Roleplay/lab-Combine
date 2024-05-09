local ox_inventory = exports.ox_inventory

local Combinations = {
    -- ['something'] = {
    --     needs = 'the other something', 
    --     result = {
    --         [1] = {name = 'some result', amount = 1},
    --         --[2] = {name = 'more results', amount = 5},
    --     }, 
    --     removeItemA = true, -- Remove the dragged item?
    --     removeItemB = true, -- Remove the item you dragged onto?
    -- },

	['regweed_bud'] = {
        needs = 'rolling_paper', 
        result = {
            [1] = {name = 'regweed_joint', amount = 1},
        }, 
        removeItemA = true, -- Remove the dragged item?
        removeItemB = true, -- Remove the item you dragged onto?
    },
    ['bananakush_bud'] = {
        needs = 'rolling_paper', 
        result = {
            [1] = {name = 'bananakush_joint', amount = 1},
        }, 
        removeItemA = true, -- Remove the dragged item?
        removeItemB = true, -- Remove the item you dragged onto?
    },
    ['bluedream_bud'] = {
        needs = 'rolling_paper', 
        result = {
            [1] = {name = 'bluedream_joint', amount = 1},
        }, 
        removeItemA = true, -- Remove the dragged item?
        removeItemB = true, -- Remove the item you dragged onto?
    },
    ['purplehaze_bud'] = {
        needs = 'rolling_paper', 
        result = {
            [1] = {name = 'purplehaze_joint', amount = 1},
        }, 
        removeItemA = true, -- Remove the dragged item?
        removeItemB = true, -- Remove the item you dragged onto?
    },
    ['tobacco'] = {
        needs = 'rolling_paper', 
        result = {
            [1] = {name = 'cigarette', amount = 1},
        },
        removeItemA = true, -- Remove the dragged item?
        removeItemB = true, -- Remove the item you dragged onto?
    },
}

local combhook = ox_inventory:registerHook('swapItems', function(payload)
    if payload.fromInventory == payload.source and payload.fromSlot ~= nil and payload.toSlot ~= nil and Combinations[payload.fromSlot.name] ~= nil and payload.toSlot.name == Combinations[payload.fromSlot.name].needs then
        TriggerClientEvent('ox_inventory:closeInventory', payload.source)
        TriggerClientEvent('lab-Combine:Combine', payload.source, payload)
        return false
    end
end,{})

RegisterNetEvent('lab-Combine:CombineDone', function(payload)
    local src = source
    if payload.source == src then
        if payload.fromInventory == payload.source and payload.fromSlot ~= nil and payload.toSlot ~= nil and Combinations[payload.fromSlot.name] ~= nil and payload.toSlot.name == Combinations[payload.fromSlot.name].needs then
            if Combinations[payload.fromSlot.name].removeItemA then
                ox_inventory:RemoveItem(src, payload.fromSlot.name, 1)
            end
            if Combinations[payload.fromSlot.name].removeItemB then
                ox_inventory:RemoveItem(src, Combinations[payload.fromSlot.name].needs, 1)
            end
            for k,v in pairs(Combinations[payload.fromSlot.name].result) do
                ox_inventory:AddItem(src, v.name, v.amount)
            end
        end
    end
end)