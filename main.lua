
require "luaclass"
require "entity.Entity"
require "entity.LivedEntity"
require "entity.vo.EntityVo"
require "proc.common"
require "proc.metic"
require "proc.skill.data_skill"
require "proc.skill.skill_proc"
require "proc.skill.move_effect"
require "proc.skill.data_move"
require "proc.skill.move_proc"
require "proc.skill.move_metic"

local function main()
	local a = io.lines()

	local vo = EntityVo()
    local ent = sLivedEntity(vo)

    ent.val.id = 1000
    ent.val.hp = 1000
    print(ent.val.id)

    local i = 0
    while i < 10 do
        skill_proc:begin_skill(ent, 10000)
        i = i + 1
    end
end


main()