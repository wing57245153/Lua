cClass.Task()

function Task:__init(func, obj)
	self.task = TaskManager:getInstance():createTask(func, obj)
	self:start()
end

function Task:start()
	self.task:start()
end