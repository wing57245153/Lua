
require "luaclass"
require "utils.math.Vector2"
require "utils.math.MathUtils"

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

require "coro.__init"

local function main()

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


    local v1 = Vector2(100,200)
    local v2 = Vector2(200,300)
    local v3 = v1 + v2
    print("--v3:----", v3.x, v3.y)
    local v4 = v3 * 10
    print("--v4:----", v4.x, v4.y)

    local function testFun()
        print("-----test coroutine--------")
        coroutine.yield(2)
        print("-----after yield--------")
    end

    CoroutineManager:getInstance():startCoroutine(testFun)
    TaskManager:getInstance():update(0.02)
    print("----------")
    TaskManager:getInstance():update(0.02)
    print("----------")
    TaskManager:getInstance():update(0.02)
    print("----------")
    TaskManager:getInstance():update(0.02)
    print("----------")
    TaskManager:getInstance():update(0.02)

end


main()