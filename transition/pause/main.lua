-- Load some default values for our rectangle.
function love.load()
    is_pause = 0
    font = love.graphics.newFont(50)
    love.graphics.setFont(font)
end
 
-- Move nams.
function love.update(dt)

end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end

-- Draw names.
function love.draw()
    if is_pause == 0 then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf("PAUSE", -150, 100, 700, "center")
        love.graphics.printf("RESTART", 250, 200, 700, "center")
        love.graphics.printf("EXIT", 250, 400, 700, "center")
    end
end