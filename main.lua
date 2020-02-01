-- pour le menu (TITRE JEU, play, option, credits, exit)

local is_menu = true
local is_credit = false
local is_music = false
local is_option = false
local h = 425
local font_size = 50
local is_play = false
love.window.setMode(1920, 1020)
width = love.graphics.getWidth()
height = love.graphics.getHeight()
--charge images etc
	function love.load()
		font = love.graphics.newFont("Stars Fighters Upright.ttf", font_size)
		love.graphics.setFont(font)
		cursor = love.graphics.newImage("pointer_on_text-ConvertImage (1).png")
		background = love.graphics.newImage("menu_background.jpg")
		sound_fx = love.audio.newSource("sound_check_menu.mp3", "stream")
		enter_fx = love.audio.newSource("enter.mp3", "stream")
		y_credit = 700
	    y_credit2 = 900
	    y_credit3 = 1100
	    y_credit4 = 1300
	    timer = 0
    	alpha = 0
    	alpha_text = 0
    	fadein  = 5
    	display = 7
    	fadeout = 4
    	fadein_text  = 4
    	display_text = 5
    	fadeout_text = 6
	    son_credit = love.audio.newSource("credits.mp3", "stream")
	    bg1 = love.graphics.newImage("bg1.png")
        zqsd = love.graphics.newImage("zqsd.jpg")
	end

function mouse_pos(x, y)
	function love.mousepressed(x, y, button)
		if (is_menu) then
			if (y >= 400 and y <= 530  and x >= 740 and x <= 1070 and button == 1) then
				is_option = false
				is_menu = false
				is_music = false
				is_credit = false
				is_play = true
			end
			if (y >= 535 and y <= 630 and x >= 695 and x <= 1115 and button == 1) then
				is_credit = false
				is_menu = false
				is_play = false
				is_option = true
			end
			if (y >= 650 and y <= 745 and x >= 695 and x <= 1115 and button == 1) then
				is_credit = true
				is_music = true
				is_menu = false
				is_option = false
			end
			if (y >= 760 and y <= 855 and x >= 800 and x <= 1055 and button == 1) then
				love.event.quit(false)
			end
		end
	end
end

--game loop:
	function love.update(dt)
		x, y = love.mouse.getPosition()
		if (is_menu) then
			mouse_pos(x, y)
			love.audio.setVolume(0.5)
			son_credit:play()
			son_credit:setLooping(true)
		end
		if (is_play) then
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
		if (is_credit) then
			if (y_credit > -90) then
		        y_credit = y_credit - 1
		    else
		        y_credit = 1200
		    end
		    if (y_credit2 > -90) then
		        y_credit2 = y_credit2 - 1
		    else
		        y_credit2 = 1200
		    end
		    if (y_credit3 > -90) then
		        y_credit3 = y_credit3 - 1
		    else
		        y_credit3 = 1200
		    end
		    if (y_credit4 > -90) then
		        y_credit4 = y_credit4 - 1
		    else
		        y_credit4 = 1200
		    end
		end
	end


function love.keypressed(key, scancode, isrepeat)
	if(is_credit) then
	   if key == "escape" then
			love.audio.setVolume(1.0)
			sound_fx:play()
	       	is_credit = false
	       	is_menu = true
	       	is_option = false
	       	is_play = false
	   	end
	end
	if(is_option) then
	   if key == "escape" then
	       	love.audio.setVolume(1.0)
			sound_fx:play()
	       	is_credit = false
	       	is_menu = true
	       	is_option = false
	       	is_play = false
	    end
	end
	if (is_menu) then
		if key == "return" and h == 755 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			love.event.quit()
		end
		if key == "return" and h == 645 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			is_credit = true
			is_menu = false
	       	is_option = false
		end
		if key == "return" and h == 535 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			is_credit = false
			is_menu = false
			is_play = false
			is_option = true
		end
		if key == "return" and h == 425 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			is_option = false
			is_menu = false
			is_music = false
			is_credit = false
			is_play = true
		end
		if key == "down" and h <= 675 then
			h = h + 110
			love.audio.setVolume(1.0)
			sound_fx:play()
		end
		if key == "up" and h >= 515 then
			h = h - 110
			love.audio.setVolume(1.0)
			sound_fx:play()
		end
	end
end
--affichage
	function love.draw()
		if (is_menu) then
			love.graphics.draw(background, 0, 0, 0)
			love.graphics.draw(cursor, (width / 2) - 450, h, 0, 0.6, 0.6)
			love.graphics.print("RUN IN TIME", (width / 2) - 350, 275)
			love.graphics.print("PLAY", (width / 2) - 160, 425)
			love.graphics.print("OPTIONS", (width / 2) - 265, 550)
			love.graphics.print("CREDITS", (width / 2) - 265, 665)
			love.graphics.print("EXIT", (width / 2) - 160, 775)
		end
		if (is_credit) then
	        love.graphics.printf("Alexis Martin", 500, y_credit, 1000, "center")
	        love.graphics.printf("Flavien Roche", 500, y_credit2, 1000, "center")
	        love.graphics.printf("Thomas Bernad", 500, y_credit3, 1000, "center")
	        love.graphics.printf("Leo Soule", 500, y_credit4, 1000, "center")
    	end
        if (is_option) then
            love.graphics.draw(zqsd, 200, 100, 0, 0.35, 0.35)
            love.graphics.setColor(255, 255, 255, 255)
            love.graphics.line(240, 690, 500, 690)
            love.graphics.rectangle("line", 200, 650, 360, 80)
            font = love.graphics.newFont("options.ttf", 40)
            love.graphics.setFont(font)
            love.graphics.printf("Use (Z, Q, S, D) to move your player forward, backward, to the left and to the right", 700, 200, 1100, "center")
            love.graphics.printf("Press space bar to jump and collect the differents parts of the time machine", 700, 615, 1100, "center")
            font = love.graphics.newFont("Stars Fighters Upright.ttf", 50)
            love.graphics.setFont(font)
        end
        if (is_play) then
			font = love.graphics.newFont("rock2.ttf", 40)
			love.graphics.setFont(font)
			love.graphics.setColor(255, 255, 255, alpha)
        	love.graphics.draw(bg1, 0, 0, 0, 1, 1)
        	love.graphics.setColor(255, 255, 255, alpha_text)
        	love.graphics.printf("World 1", 80, 300, 1800, "center")
        	love.graphics.printf("Prehistory", 80, 450, 1800, "center")
    	end
	end