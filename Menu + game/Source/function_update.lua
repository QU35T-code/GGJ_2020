function scroll_credit()
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

------------------------------------------------------------------------------------------------------------------------------------------------------------

function transition_menu_level1(dt)
	if (is_game and is_menu == false) then
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
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function animations_frame(size, end_table, dt)
	hero.frame = hero.frame + size * dt
	if (hero.frame >= #end_table + 1) then
		hero.frame = 1
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function jump(dt)
	if (is_jump and is_ground == false) then
		hero.y = hero.y - 200 * dt
		if (hero.y <= 780) then
			is_descente = true
			is_jump = false
			is_ground = true
			is_idle = true
		end
	end

	if (is_descente) then
		hero.y = hero.y + 200 * dt
	end
	if (hero.y >= 900) then
		hero.y = 900
		is_ground = true
		is_jump = false
		is_descente = false
	end

	if (is_descente and love.keyboard.isDown('d')) then
		is_jump = false
		is_descente = true
	end
	if (is_descente and love.keyboard.isDown('q')) then
		is_jump = false
		is_descente = true
	end
	if (is_jump and love.keyboard.isDown('d') and is_descente == false) then
		is_jump = false
		is_descente = false
	end
	if (is_jump and love.keyboard.isDown('q') and is_descente == false) then
		is_jump = false
		is_descente = false
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function objets(dt)
	rotation_objects = rotation_objects + 4 * dt
	if (compteur_piece_4 == 1 and compteur_piece_2 == 1 and compteur_piece_3 == 1 and compteur_piece_1 == 1 and hero.x >= 1700) then
		is_validate = true
		is_game = false
		is_menu = false
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function set_background_level(x_background2, x_background)
	if (x_background2 == 0) then
		x_background = 0
		x_background2 = 1920
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function scroll_camera(dt)
	if (hero.x >= 1000) then
		is_stop_defile = true
		speed = 6
	end
	if (hero.x <= 1000) then
		is_stop_defile = false
		speed = 2.5
	end
	if (hero.x <= 0) then
		is_stop_defile = true
		is_run = false
		is_run_rev = false
		is_idle_rev = true
		is_idle = false
		hero.x = 0
	end

	if (hero.x >= width - hero.width - 20) then
		hero.x = width - hero.width - 20
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

