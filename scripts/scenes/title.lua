-- Class Scenes.title
Scenes.title = {}
Scenes.title.__index = Scenes.title

function Scenes.title.new()
    local self = setmetatable({}, Scenes.title)

    score = 0
    player = Player.new(60, 90, 1, 1, {x1=0,y1=0,x2=7,y2=7})
    stars = Stars.new(20)
    enemies = Enemies.new()
    bullets = Bullets.new()
    explosions = Explosions.new() 
       
    return self
end

function Scenes.title:update()
    stars:update()
    if(btn(❎)) load_scene("game")
end

function Scenes.title:draw()
    cls()
    stars:draw()
    spr(Sprite.TITLE_A1,36,28,6,1)
    print("- press ❎ to begin -",20,90, 12)
end