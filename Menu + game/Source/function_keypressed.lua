function options_menu(key)
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
		is_game = false
		is_option = true
	end
	if key == "return" and h == 425 then
		love.audio.setVolume(1.0)
		enter_fx:play()
		is_option = false
		is_menu = false
		is_music = false
		is_credit = false
		is_game = true
		init = true
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

------------------------------------------------------------------------------------------------------------------------------------------------------------

function options_menu_annexe(key)
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
end

------------------------------------------------------------------------------------------------------------------------------------------------------------