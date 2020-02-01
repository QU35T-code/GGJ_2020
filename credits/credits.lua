-- Load some default values for our rectangle.
function love.load()
    is_credit = 0
    y_credit = 700
    y_credit2 = 900

    son_credit = love.audio.newSource("sounds/credits.mp3", "stream")
    font = love.graphics.newFont("credits.ttf", 50)
    love.graphics.setFont(font)
    text = love.graphics.newText(font, "Alexis Martin")
    text = love.graphics.newText(font, "Flavien Roche")
    text = love.graphics.newText(font, "Thomas Bernad")
    text = love.graphics.newText(font, "Neil Peyrot")
    text = love.graphics.newText(font, "Léo Soule")
end
 
-- Move nams.
function love.update(dt)
    if (y_credit > -90) then
        y_credit = y_credit - 1
    else
        y_credit = 700
    end
    if (y_credit2 > -90) then
        y_credit2 = y_credit2 - 1
    else
        y_credit2 = 800
    end
end
 
function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end

-- Draw names.
function love.draw()
    if is_credit == 0 then
        love.audio.play(son_credit)
        love.graphics.printf("Alexis Martin", 500, y_credit, 100, "center")
        love.graphics.printf("Flavien Roche", 200, y_credit, 120, "center")
        love.graphics.printf("Thomas Bernad", 350, y_credit, 140, "center")
        love.graphics.printf("Neil Peyrot", 250, y_credit2, 120, "center")
        love.graphics.printf("Léo Soule", 400, y_credit2, 140, "center")
    end
end