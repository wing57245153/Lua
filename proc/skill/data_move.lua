
------逻辑动作数据----
data_move = {}

function data_move:get_all_move_code(moveId)
    --local move_data = AllData:getMove_dataConfig()
    --local codeList = move_data:getValue(moveId, "move", {})
    --return codeList 
    return {{"normal_damage", 1.1, 2}}
end

function data_move:get_target(caster, moveId)
	-----test---
	local vo = EntityVo()
	local ent = sLivedEntity(vo)
    return {ent}
end

-----能否进行逻辑动作的目标做判定
function data_move:check_can_move_cond(caster, target, moveId)
	--local condId = self:get_move_condition(moveId)
	--local result = self:get_move_condition_by_cond_id(condId, caster, target)
	return true
end