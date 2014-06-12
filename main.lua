
require "luaclass"
require "entity.Entity"
require "entity.LivedEntity"
require "entity.vo.EntityVo"
require "proc.common"
require "proc.skill.data_skill"
require "proc.skill.skill_proc"
require "proc.skill.move_effect"
require "proc.skill.data_move"
require "proc.skill.move_proc"

local function main()
	local vo = EntityVo()
    local ent = sLivedEntity(vo)

    ent.attr.id = 1000
    print(ent.attr.id)

    skill_proc:begin_skill(ent, 10000)
end


main()