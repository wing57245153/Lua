cClass.CoroutineManager()

local instance = nil


function CoroutineManager:__init()

end

function CoroutineManager:getInstance()
	if instance == nil then
		instance = CoroutineManager()
	end
	return instance
end

function CoroutineManager:startCoroutine(func)
	local t = Task(func)
	return t
end