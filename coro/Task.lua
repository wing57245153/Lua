cClass.Task()

function Task:__init(func)
	self.task = TaskManager:getInstance():createTask(func)
	self:start()
end

function Task:start()
	self.task:start()
end