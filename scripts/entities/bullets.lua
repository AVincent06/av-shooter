-- Class Bullets
Bullets = {}
Bullets.__index = Bullets

function Bullets.new()
    local self = setmetatable({}, Bullets)
    self.group = {}
    return self
end

function Bullets:fire(startX, startY, endX, endY, sprite, x1, y1, x2, y2, speed)
	new_bullet={
		x=startX,
		y=startY,
		angle=calculateAngle(startX, startY, endX, endY),
		speed=speed,
		sprite=sprite,
		box={
			x1=x1,
			y1=y1,
			x2=x2,
			y2=y2
		}
	}
	add(self.group,new_bullet)
	sfx(0)
end

function Bullets:update()
	for b in all(self.group) do
		dX=sin(b.angle)*b.speed
		dY=cos(b.angle)*b.speed
		b.x += dX
		b.y += dY
		if b.y<-8 then
			del(self.group,b)
		end
	end
end

function Bullets:draw()
    for b in all(self.group) do
		spr(b.sprite,b.x,b.y)
	end
end