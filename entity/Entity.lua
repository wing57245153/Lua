cClass.sEntity()

function sEntity:__init(entityVo)
    
    self.entityVo = entityVo

    self.attr = {}

    local mt = {}
    mt.__index = function(table, key)
            return self:getAttrValue(key)
        end

    mt.__newindex = function(table, key, value)
            self:setAttrValue(key, value)
        end

    setmetatable(self.attr, mt)
end

----------------
function sEntity:onEnterWorld()
end

function sEntity:onLeaveWorld()

end

----------------------
function sEntity:getAttrValue(key)
    return self.entityVo[key]
end

function sEntity:setAttrValue(key, value)
    self.entityVo[key] = value
end