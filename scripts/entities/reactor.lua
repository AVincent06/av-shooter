-- Class Reactor
Reactor = {}
Reactor.__index = Reactor

function Reactor.new(intensity, speed, posX, posY)
    local self = setmetatable({}, Reactor)
    self.intensity = intensity
    self.speed = speed
    self.posX = posX
    self.posY = posY
    self.particles = {}

    for i=1,self.intensity do
        self:createParticle()
    end

    return self
end

function Reactor:draw(posX, posY)
    self.posX = posX
    self.posY = posY
    
    for part in all(self.particles) do
		pset(part.x,part.y,part.col)
		part.x+=part.dx
		part.y+=part.dy
		part.t+=1
		if part.t>part.maxt then
			del(self.particles,part)
			self:createParticle()
		end
	end
end

function Reactor:createParticle()
	local part = {
		x=self.posX+rnd({3,4}),
		y=self.posY+8,
		col=rnd({7,9,10}),
		dx=(rnd(2)-1)*self.speed,
		dy=self.speed,
		t=0,
		maxt=flr(rnd(20))
	}
	add(self.particles, part)
end
