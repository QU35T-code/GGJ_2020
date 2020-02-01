-- Load some default values for our rectangle.
function love.load()
    is_option = 0
    timer = 0
    alpha = 0
    alpha_text = 0
    fadein  = 5
    display = 7
    fadeout = 4
    fadein_text  = 4
    display_text = 5
    fadeout_text = 6
    font = love.graphics.newFont("rock2.ttf", 35)
    love.graphics.setFont(font)
    image = love.graphics.newImage("")
end
 
-- Move nams.
function love.update(dt)
  timer = (timer + dt)

  if timer < fadein then 
    alpha = timer / fadein
  elseif timer < display then 
    alpha = 1
  elseif timer < fadeout then
    alpha = 1- ((timer - display) / (fadeout - display))
  else 
    alpha = 255
  end

  if timer < fadein then 
    alpha_text = timer / fadein_text
  elseif timer < display_text then 
    alpha_text = 1
  elseif timer < fadeout_text then
    alpha_text = 1- ((timer - display_text) / (fadeout_text - display_text))
  else 
    alpha_text = 0
  end
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end

-- Draw names.
function love.draw()
    if is_option == 0 then
        love.graphics.setColor(255, 255, 255, alpha)
        love.graphics.draw(image)
        love.graphics.setColor(255, 255, 255, alpha_text)
        love.graphics.printf("Monde 1", 100, 120, 700, "center")
        love.graphics.printf("Prehistoire", 100, 190, 700, "center")
    end
end
