function menu_draw()
	if (is_menu and is_game == false) then
		font = love.graphics.newFont("Polices/Stars Fighters Upright.ttf", 50)
        love.graphics.setFont(font)
		love.graphics.draw(background_menu, 0, 0, 0)
		love.graphics.draw(cursor, (width / 2) - 450, h, 0, 0.6, 0.6)
		love.graphics.print("RUN IN TIME", (width / 2) - 350, 275)
		love.graphics.print("PLAY", (width / 2) - 160, 425)
		love.graphics.print("OPTIONS", (width / 2) - 265, 550)
		love.graphics.print("CCREDITS", (width / 2) - 265, 665)
		love.graphics.print("EXIT", (width / 2) - 160, 775)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function options_draw()
	if (is_option and is_menu == false and is_game == false) then
        love.graphics.draw(zqsd, 200, 100, 0, 0.35, 0.35)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.line(240, 690, 500, 690)
        love.graphics.rectangle("line", 200, 650, 360, 80)
        font = love.graphics.newFont("Polices/options.ttf", 40)
        love.graphics.setFont(font)
        love.graphics.printf("Use (Z, Q, S, D) to move your player forward, backward, to the left and to the right", 700, 200, 1100, "center")
        love.graphics.printf("Press space bar to jump and collect the differents parts of the time machine", 700, 615, 1100, "center")
        font = love.graphics.newFont("Polices/Stars Fighters Upright.ttf", 50)
        love.graphics.setFont(font)
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function credits_draw()
	if (is_credit and is_menu == false and is_game == false) then
	    love.graphics.printf("Alexis Martin", 500, y_credit, 1000, "center")
	    love.graphics.printf("Flavien Roche", 500, y_credit2, 1000, "center")
	    love.graphics.printf("Thomas Bernad", 500, y_credit3, 1000, "center")
	    love.graphics.printf("Leo Soule", 500, y_credit4, 1000, "center")
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function transition_text()
	font = love.graphics.newFont("Polices/rock2.ttf", 40)
	love.graphics.setFont(font)
	love.graphics.setColor(255, 255, 255, alpha)
	love.graphics.draw(background_game_lv1, -1900, 0)
	love.graphics.draw(background_game_lv1, x_background, y_background)
	love.graphics.draw(background_game_lv1, x_background_2, y_background_2)
	love.graphics.setColor(255, 255, 255, alpha_text)
    love.graphics.printf("World 1", 80, 300, 1800, "center")
    love.graphics.printf("Prehistory", 80, 450, 1800, "center")
	love.graphics.setColor(255, 255, 255, alpha)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function objets_draw()
	if (is_destroy_1 == false) then
		love.graphics.draw(Objets[1], x_objet_1, y_objet_1, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
	end
	if (is_destroy_2 == false) then
		love.graphics.draw(Objets[2], x_objet_2, y_objet_2, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
	end
	if (is_destroy_3 == false) then
		love.graphics.draw(Objets[3], x_objet_3, y_objet_3, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
	end
	if (is_destroy_4 == false) then
		love.graphics.draw(Objets[4], x_objet_4, y_objet_4, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function hero_draw()
	local framearrondie = math.floor(hero.frame)
	if (is_idle and is_idle_rev == false and is_jump == false and is_ground == true) then
		love.graphics.draw(hero.images_idle_dino[framearrondie], hero.x, hero.y - 100, 0, hero.width / 250, hero.height / 250)
	end
	if (is_idle_rev and is_idle == false and is_run_rev == false and is_jump == false and is_ground == true) then
		love.graphics.draw(hero.images_idle_dino_rev[framearrondie], hero.x, hero.y - 100, 0, hero.width / 250, hero.height / 250)
	end
	if (is_run and is_idle == false and is_jump == false and is_ground == true and is_descente == false) then
		love.graphics.draw(hero.images_dino_run[framearrondie], hero.x, hero.y - 100, 0, hero.width / 250, hero.height / 250)
	end
	if (is_run_rev and is_idle_rev == false and is_jump == false and is_ground == true) then
		love.graphics.draw(hero.images_run_dino_rev[framearrondie], hero.x, hero.y - 100, 0, hero.width / 250, hero.height / 250)
	end
	if (is_jump and is_jump_rev == false and is_ground == false) then
		love.graphics.draw(hero.images_jump_dino[framearrondie], hero.x, hero.y - 100, 0, hero.width / 250, hero.height / 250)
	end
	if (is_jump_rev and is_jump_rev == false and is_ground == false) then
		love.graphics.draw(hero.images_jump_dino_rev[framearrondie], hero.x, hero.y - 100, 0, hero.width / 250, hero.height / 250)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function pause_draw()
	love.graphics.draw(pause, 0, 0)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------


