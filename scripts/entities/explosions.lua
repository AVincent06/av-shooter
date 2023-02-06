-- Class Explosions
Explosions = {}
Explosions.__index = Explosions

function Explosions.new()
    local self = setmetatable({}, Explosions)
    self.explosions = {}
    return self
end

function Explosions:update()
	for e in all(self.explosions) do
		e.timer+=1
		if e.timer==13 then
			del(self.explosions,e)
		end
	end
end

function Explosions:draw()
	for e in all(self.explosions) do
		circ(
			e.x,
			e.y,
			e.timer/3,
			8+e.timer%3
		)
	end
end

function Explosions:create(x,y)
	sfx(1)
	add(self.explosions,{
		x=x,
		y=y,
		timer=0
	})
end