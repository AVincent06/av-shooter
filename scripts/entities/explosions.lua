-- Class Explosions
Explosions = {}
Explosions.__index = Explosions

function Explosions.new()
    local self = setmetatable({}, Explosions)
    self.explosions = {}
    return self
end

function Explosions:update()
	for part in all(self.explosions) do
		local ratio = part.maxt/5
		if(part.t<=ratio*5) part.col=5
		if(part.t<=ratio*4) part.col=4
		if(part.t<=ratio*3) part.col=3
		if(part.t<=ratio*2) part.col=2
		if(part.t<=ratio*1) part.col=1
		part.x+=part.dx
		part.y+=part.dy
		part.t+=1
		if part.t>part.maxt then
			del(self.explosions,part)
		end
	end
end

function Explosions:draw()
	local color = {7,10,9,8,5}
	for part in all(self.explosions) do
		circfill(part.x, part.y, part.radius, color[part.col])
	end
end

function Explosions:create(nb, posX, posY)
	sfx(1)
	local amplitude = 2
	local speed = 1.5
	for i = 1,nb do
		local part = {
			x=posX+(rnd()-0.5)*amplitude,
			y=posY+(rnd()-0.5)*amplitude,
			radius=ceil(rnd()*5),
			col=5,
			dx=(rnd()-0.5)*speed,
			dy=(rnd()-0.5)*speed,
			t=0,
			maxt=5+flr(rnd(20))
		}
		add(self.explosions, part)
	end
end