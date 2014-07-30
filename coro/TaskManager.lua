cClass.TaskManager()

local instance = nil


function TaskManager:__init()
	self.coroutineId = 1
    self.coroutineList = {}
end

function TaskManager:getInstance()
	if instance == nil then
		instance = TaskManager()
	end
	return instance
end

function TaskManager:createTask(func)
	return TaskState(func)
end


function TaskManager:startCoroutine(coro, taskState)
	local result, value = coroutine.resume(coro, taskState)
	if result == true then
		if value == 0 or value == nil then
			value = 1
		end
    	self.coroutineList[self.coroutineId] = {coro = coro, cur = value, taskState = taskState}
    	self.coroutineId = self.coroutineId + 1
    end
end

--update by extra
function TaskManager:update(dt)
	for key,item in pairs(self.coroutineList) do
		local coro = item["coro"]
		local cur = item["cur"]
		local taskState = item["taskState"]
		if cur <= 0 then
			local result, value = coroutine.resume(coro, taskState)
			print(result, value)
			if result == false then
				self.coroutineList[key] = nil
				item["cur"] = value
			end
		else
			item["cur"] = cur - 1
		end
	end
end

------------------------------------
cClass.TaskState()

function TaskState:__init(func)
	self.coroutine = coroutine.create(func)
end

function TaskState:start()
	self.running = true
	local coro = coroutine.create(self.CallWrapper)
	TaskManager:getInstance():startCoroutine(coro, self)
end

----
function TaskState:CallWrapper()
	while self.running == true do
		local result = self:moveNext()
    	if result == true then
    		coroutine.yield(self.current)
    	else
    		self.running = false
    	end
    end
end

function TaskState:moveNext()
	local result, value = coroutine.resume(self.coroutine)
	self.current = value
	return result
end