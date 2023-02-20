-- Class Enemies
Enemies = {}
Enemies.__index = Enemies

function Enemies.new()
    local self = setmetatable({}, Enemies)
    self.group = {}
    return self
end

function Enemies:update()
    if #self.group == 0 then
        self:spawn(ceil(rnd(7)))
    end
	for e in all(self.group) do
		e.y+=0.3
		if e.y > 128 then
			del(self.group,e)
		end

		for b in all(bullets.group) do
			if ( collision(e,b) and isEnemy(e,b) ) then
				del(bullets.group,b)
				e.life -= 1
				e.flash = 5
				if e.life==0 then
					explosions:create(20, b.x+4, b.y+2)
					del(self.group,e)
					score+=e.score
				end
			end
		end
	end
end

function Enemies:draw()
	for e in all(self.group) do

		if(e.animF<=1 or e.animF>=60) then
			e.animD = -e.animD
			e.animF += e.animV*e.animD
		else
			e.animF += e.animV*e.animD
		end
		if(e.animF>=1 and e.animF<=15) e.sprite=e.animation[1]
		if(e.animF>=16 and e.animF<=45) e.sprite=e.animation[2]
		if(e.animF>=46 and e.animF<=60) e.sprite=e.animation[3]

		if(e.flash > 0) then
			for i=1,15 do
				pal(i,7)
			end 
			spr(e.sprite, e.x, e.y)
			pal()
			e.flash-=1
		else
			spr(e.sprite, e.x, e.y)
		end
	end
end

function Enemies:spawn(amount)
	gap=(128-8*amount)/(amount+1)
	for i=1,amount do
		new_enemy={
			x=gap*i+8*(i-1),
			y=-20,
			life=2,
			score=100,
			sprite=Sprite.ALIEN_1,
			flash=0,
			box={x1=2,y1=2,x2=5,y2=5},
			animD=1,
			animF=2,
			animV=2,
			animation={
				Sprite.ALIEN_1,
				Sprite.ALIEN_2,
				Sprite.ALIEN_3,
			}
		}
		add(self.group,new_enemy)
	end
end