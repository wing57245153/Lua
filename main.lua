
require "luaclass"

require "fms.BaseState"
require "fms.IdleState"
require "fms.StateMachine"
require "fms.enum"
require "fms.MsgDispatcher"
require "fms.Telegram"
require "fms.WalkState"

require "entity.Entity"
require "entity.LivedEntity"
require "entity.EntityFactory"
require "entity.vo.EntityVo"
require "proc.common"
require "proc.metic"
require "proc.skill.data_skill"
require "proc.skill.skill_proc"
require "proc.skill.move_effect"
require "proc.skill.data_move"
require "proc.skill.move_proc"
require "proc.skill.move_metic"
require "proc.config.init"



local function main()
	local a = io.lines()

	local vo = EntityVo()
    vo.id = 1000
    vo.hp = 1000
    --local ent = sLivedEntity(vo)
    local ent = sEntityFactory:getInstance():create(vo)

    --ent.val.id = 1000
    --ent.val.hp = 1000
    print(ent.val.id)

    --[[
    local i = 0
    while i < 1 do
        skill_proc:begin_skill(ent, 2020101)
        i = i + 1
    end
    --]]

    ent:update()

    MsgDispatcher:getInstance():dispatchMsg(vo.id, vo.id, fms.message_type.idle2walk)

end


main()