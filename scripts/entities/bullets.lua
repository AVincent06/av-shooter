-- Class Bullets
Bullets = {}
Bullets.__index = Bullets

function Bullets.new()
    local self = setmetatable({}, Bullets)
    self.bullets = {}
    return self
end

function Bullets:fire(posX, posY)
	new_bullet={
		x=posX,
		y=posY,
		speed=4,
		box={x1=2,y1=0,x2=5,y2=4}
	}
	add(self.bullets,new_bullet)
	sfx(0)
end

function Bullets:update()
	for b in all(self.bullets) do
		b.y-=b.speed
		if b.y<-8 then
			del(self.bullets,b)
		end
	end
end

function Bullets:draw()
    for b in all(self.bullets) do
		spr(2,b.x,b.y)
	end
end
