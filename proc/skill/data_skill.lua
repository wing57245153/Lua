-------技能相关数据处理------
data_skill = {}


----技能是否需要引导----
function data_skill:get_skill_is_need_guide( skillId )
    return skill_common.NO_GUIDE --TODO
end

function data_skill:get_skill_act_move(skillId)
    local moveId = 1000 --TODO
    return moveId
end
