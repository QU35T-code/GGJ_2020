-- Load some default values for our rectangle.
function love.load()
    is_option = 0
    font = love.graphics.newFont("Stars Fighters Upright.ttf", 18)
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
    if is_option == 0 then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf("You need to collect the differents pieces", 100, 120, 700, "center")
        love.graphics.printf("in order the repair your time machine", 100, 190, 700, "center")
        love.graphics.printf("and return to the right time", 100, 260, 700, "center")
        love.graphics.setColor(150, 150, 0, 255)
        love.graphics.printf("Control your player with the arrows and jump with the space bar", 100, 390, 700, "center")
    end
end