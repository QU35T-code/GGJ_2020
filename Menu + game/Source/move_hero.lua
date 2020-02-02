function left_move(dt)
	if (love.keyboard.isDown('q')) then
		if (is_stop_defile == false) then
			x_background = x_background + 200 * dt
			x_background_2 = x_background_2 + 200 * dt
			x_objet_1 = x_objet_1 + 200 * dt
			x_objet_2 = x_objet_2 + 200 * dt
			x_objet_3 = x_objet_3 + 200 * dt
			x_objet_4 = x_objet_4 + 200 * dt
		end
		is_jump = false
		is_ground = true
		is_idle = false
		is_run = false
		is_run_rev = true
		is_idle_rev = false
		hero.x = hero.x - speed
		hero.frame = hero.frame + 5 * dt
		if (hero.frame >= #hero.images_run_dino_rev + 1) then
			hero.frame = 1
		end
		function love.keyreleased(key)
			if (key == 'q') then
				is_idle_rev = true
				is_idle = false
				is_run = false
				is_run_rev = false
			end
			if (key == 'd') then
				is_idle = false
				is_idle_rev = true
				is_run = false
				is_run_rev = false
			end
		end
		if (love.keyboard.isDown('q') and love.keyboard.isDown('d')) then
			is_run = false
			is_run_rev = false
			is_idle = false
			is_idle_rev = true
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function right_move(dt)
	if (love.keyboard.isDown('d')) then
		if (is_stop_defile == false) then
			x_background = x_background - 200 * dt
			x_background_2 = x_background_2 - 200 * dt
			x_objet_1 = x_objet_1 - 200 * dt
			x_objet_2 = x_objet_2 - 200 * dt
			x_objet_3 = x_objet_3 - 200 * dt
			x_objet_4 = x_objet_4 - 200 * dt
		end
		is_ground = true
		is_jump = false
		is_idle = false
		is_run_rev = false
		is_run = true
		is_idle_rev = false
		hero.x = hero.x + speed
		hero.frame = hero.frame + 5 * dt
		if (hero.frame >= #hero.images_dino_run + 1) then
			hero.frame = 1
		end
		function love.keyreleased(key)
			if (key == 'd') then
				is_idle_rev = false
				is_idle = true
				is_run = false
				is_run_rev = false
			end
			if (key == 'q') then
				is_idle_rev = false
				is_idle = true
				is_run = false
				is_run_rev = false
			end
		end
		if (love.keyboard.isDown('q') and love.keyboard.isDown('d')) then
			is_run = false
			is_run_rev = false
			is_idle = true
			is_idle_rev = false
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

