-------------
move_effect = {}


-----%% @doc 普通攻击
-----%% @doc 先检测闪避
function move_effect:check_damage(target, caster, ratio, extra, moveId, hits)
    print("----------check_damage-----------", target.attr.id, caster.attr.id)
end