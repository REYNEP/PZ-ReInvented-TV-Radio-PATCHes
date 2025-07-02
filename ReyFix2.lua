                                                                -- function ISRadioWindow:readFromObject( _player, _deviceObject )
                                                                -- self.device = _deviceObject;
    local m_Device = self.device                                -- so that we can access inside ---> local function checkName()
    local function checkName(inventoryItemFullType)             -- inventoryItemFullType = item ID = `Radio.TvBlack` [B41] = `Base.TvBlack` [B42] = unique identifier

        if (instanceof(m_Device, "IsoObject"))                  -- make sure that we have children of `zombie.iso.IsoObject`
        then
            local REY_IsoObject = m_Device                      -- zombie.iso.objects.IsoTelevision@747bfeba                                             
            -- print("[REY]:- " .. tostring(REY_IsoObject))     -- REY LOG
            return inventoryItemFullType == REY_IsoObject:getProperties():Val("CustomItem")   
                                                                -- Check `Radio.TvBlack == Radio.TvBlack` ideally....

        elseif (instanceof(m_Device, "InventoryItem"))
        then
            local REY_InventoryItem = m_Device
            -- print("[REY]:- " .. tostring(REY_InventoryItem)) -- REY LOG
            return inventoryItemFullType == REY_InventoryItem:getFullType()                 
                                                                -- Check `Radio.TvBlack == Radio.TvBlack` ideally....

        else
            print("[REY ERROR]:- UnSupported KahLua DynamicObject --> " .. tostring(m_Device))
        end

    end

-- changed `checkName`
-- inside ISRadioWindow:prerender()
-- inside function ISRadioWindow:readFromObject( _player, _deviceObject )