-- Class Stars
Stars = {}
Stars.__index = Stars

function Stars.new(amount)
    local self = setmetatable({}, Stars)
    self.amount = amount
    self.stars = {}

    for i=1,self.amount do
		z=ceil(rnd(3))
		new_star={
			x=rnd(128),
			y=rnd(128),
			col=4+z,
			speed=0+z-0.5
		}
		add(self.stars,new_star)
	end

    return self
end

function Stars:update()
    for s in all(self.stars) do
		s.y+=s.speed
		if s.y>128 then
			s.y=0
			s.x=rnd(128)
		end
	end
end

function Stars:draw()
    for s in all(self.stars) do
		pset(s.x,s.y,s.col)
	end
end