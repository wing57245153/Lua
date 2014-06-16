cClass.WalkState(BaseState)

function WalkState:__init(owner)

end

function WalkState:enter(owner)
	print('-----i enter walk-----------')
end

function WalkState:execute(owner)
	print("----i execute walk")
end

function WalkState:exit(owner)
	print("----i exit walk")
end