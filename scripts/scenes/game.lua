-- Class Scenes.game
Scenes.game = {}
Scenes.game.__index = Scenes.game

function Scenes.game.new()
    local self = setmetatable({}, Scenes.game)
    return self
end

function Scenes.game:update()
    player:update()
    player:collisionWith(enemies)
    player:collisionWith(bullets)
    stars:update()
    enemies:update()

    --fire
    if(btnp(❎)) bullets:fire(player.x, player.y, player.x, 1, Sprite.BULLET_P, 2, 0, 5, 4, 4)
    if(t()%1==0) then
        local gunner = rnd(enemies.group)
        if(gunner and gunner.y<=120) then
            bullets:fire(gunner.x, gunner.y, player.x, player.y, Sprite.BULLET_E, 3, 3, 6, 6, 1)
        end
    end

    bullets:update()
    explosions:update()
end

function Scenes.game:draw()
    cls()
    player:draw()
    stars:draw()
    enemies:draw()
    bullets:draw()
    explosions:draw()
	rect(0,0,127,127,5)
    print(score,2,2,10)
    if player.life > 0 then
        for i=1,player.life do
            spr(Sprite.PLAYER_1UP, 2+(7*i)-7, 123)
        end
    end
end