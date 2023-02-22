Scenes = {}

function _init()
    load_scene("title")
end

function _update60()
    current_scene:update()
end

function _draw()
    current_scene:draw()
end

function load_scene(name)
    next_scene = Scenes[name]
    if current_scene != next_scene then
      previous_scene = current_scene
  
      current_scene = next_scene
      current_scene.new()
    end
    next_scene = nil
end