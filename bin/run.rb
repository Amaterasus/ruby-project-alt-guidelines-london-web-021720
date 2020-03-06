require_relative '../config/environment'

set title: "Release The swarm",
    width: 900,
    height: 500,
    background: "teal",
    boarderless: true

player = nil
game = nil
enemy = []
leaderboard_open = false
text_colour = "orange"
box_colour = "aqua"
Leaderboard.set_ranking
leaderboard_positions = Leaderboard.all.sort_by { |position| position.rank }

name_capture = Rectangle.new(
    width: 200, height: 75,
    x: 350, y: 200,
    color: 'aqua',
    z: 20)

name_capture_label = Text.new("Username:", color: text_colour, x: name_capture.x + 45 , y: name_capture.y, z: name_capture.z * 2)
name_capture_text = Text.new("", color: text_colour, x: name_capture.x + 20 , y: name_capture.y + 30, z: name_capture.z * 2)
new_game = Rectangle.new( width: 200, height: 35, x: 350, y: 100, color: box_colour, z: 20, opacity: 0)
new_game_label = Text.new("New game", color: text_colour, x: new_game.x + 55 , y: new_game.y, z: new_game.z * 2, opacity: 0)
leaderboard = Rectangle.new( width: 200, height: 35, x: 350, y: 150, color: box_colour, z: 20, opacity: 0)
leaderboard_label = Text.new("Leaderboard", color: text_colour, x: leaderboard.x + 45 , y: leaderboard.y, z: leaderboard.z * 2, opacity: 0)
change_player = Rectangle.new( width: 200, height: 35, x: 350, y: 200, color: box_colour, z: 20, opacity: 0)
change_player_label = Text.new("Change player", color: text_colour, x: change_player.x + 40 , y: change_player.y, z: change_player.z * 2, opacity: 0)
delete_player = Rectangle.new( width: 200, height: 35, x: 350, y: 250, color: box_colour, z: 20, opacity: 0)
delete_player_label = Text.new("Delete player", color: text_colour, x: delete_player.x + 45 , y: delete_player.y, z: delete_player.z * 2, opacity: 0)
quit = Rectangle.new( width: 200, height: 35, x: 350, y: 300, color: box_colour, z: 20, opacity: 0)
quit_label = Text.new("Quit", color: text_colour, x: quit.x + 85 , y: quit.y, z: quit.z * 2, opacity: 0)

first_place = Rectangle.new( width: 200, height: 35, x: 200, y: 65, color: box_colour, z: 20, opacity: 0)
first_place_label = Text.new("1: ", color: text_colour, x: first_place.x + 10 , y: first_place.y, z: first_place.z * 2, opacity: 0)
second_place = Rectangle.new( width: 200, height: 35, x: 200, y: 135, color: box_colour, z: 20, opacity: 0)
second_place_label = Text.new("2: ", color: text_colour, x: second_place.x + 10 , y: second_place.y, z: second_place.z * 2, opacity: 0)
third_place = Rectangle.new( width: 200, height: 35, x: 200, y: 205, color: box_colour, z: 20, opacity: 0)
third_place_label = Text.new("3: ", color: text_colour, x: third_place.x + 10 , y: third_place.y, z: third_place.z * 2, opacity: 0)
fourth_place = Rectangle.new( width: 200, height: 35, x: 200, y: 275, color: box_colour, z: 20, opacity: 0)
fourth_place_label = Text.new("4: ", color: text_colour, x: fourth_place.x + 10 , y: fourth_place.y, z: fourth_place.z * 2, opacity: 0)
fifth_place = Rectangle.new( width: 200, height: 35, x: 200, y: 345, color: box_colour, z: 20, opacity: 0)
fifth_place_label = Text.new("5: ", color: text_colour, x: fifth_place.x + 10 , y: fifth_place.y, z: fifth_place.z * 2, opacity: 0)
sixth_place = Rectangle.new( width: 200, height: 35, x: 500, y: 65, color: box_colour, z: 20, opacity: 0)
sixth_place_label = Text.new("6: ", color: text_colour, x: sixth_place.x + 10 , y: sixth_place.y, z: sixth_place.z * 2, opacity: 0)
seventh_place = Rectangle.new( width: 200, height: 35, x: 500, y: 135, color: box_colour, z: 20, opacity: 0)
seventh_place_label = Text.new("7: ", color: text_colour, x: seventh_place.x + 10 , y: seventh_place.y, z: seventh_place.z * 2, opacity: 0)
eigth_place = Rectangle.new( width: 200, height: 35, x: 500, y: 205, color: box_colour, z: 20, opacity: 0)
eigth_place_label = Text.new("8: ", color: text_colour, x: eigth_place.x + 10 , y: eigth_place.y, z: eigth_place.z * 2, opacity: 0)
ninth_place = Rectangle.new( width: 200, height: 35, x: 500, y: 275, color: box_colour, z: 20, opacity: 0)
ninth_place_label = Text.new("9: ", color: text_colour, x: ninth_place.x + 10 , y: ninth_place.y, z: ninth_place.z * 2, opacity: 0)
tenth_place = Rectangle.new( width: 200, height: 35, x: 500, y: 345, color: box_colour, z: 20, opacity: 0)
tenth_place_label = Text.new("10: ", color: text_colour, x: tenth_place.x + 10 , y: tenth_place.y, z: tenth_place.z * 2, opacity: 0)

back = Rectangle.new( width: 200, height: 35, x: 600, y: 400, color: box_colour, z: 20, opacity: 0)
back_label = Text.new("BACK", color: text_colour, x: back.x + 75 , y: back.y, z: back.z * 2, opacity: 0)

score_label = nil


on :key_held do |event|
    if player && game
        player.move(event.key)
    end
end

on :key_up do |event|
    if player

    elsif event.key == "backspace"
        name_capture_text.text = name_capture_text.text.delete_suffix(name_capture_text.text.last)
    elsif name_capture_text.text.length > 2 && event.key == "return"
        player = Player.find_or_create_by(name: name_capture_text.text)
        player.make_pos
    elsif name_capture_text.text.length > 15
            
    elsif event.key.length == 1
        name_capture_text.text += event.key
    end
    name_capture_text.text.capitalize!
end

on :mouse_down do |event|
    if player
        if leaderboard_open
            if event.x > 599 && event.x < 801 && event.y > 399 && event.y < 436
                leaderboard_open = false
            end
        elsif game

        elsif event.x > 349 && event.x < 551 && event.y > 99 && event.y < 136
            game = Game.create(player: player, time_played: 0, score: 0, enemies_killed: 0, leaderboard: Leaderboard.create)
        elsif event.x > 349 && event.x < 551 && event.y > 149 && event.y < 186
            leaderboard_open = true
        elsif event.x > 349 && event.x < 551 && event.y > 199 && event.y < 236
            Leaderboard.set_ranking
            player = nil
        elsif event.x > 349 && event.x < 551 && event.y > 249 && event.y < 286
            to_be_destroyed = player.games.map { |game| game.leaderboard }
            to_be_destroyed.each { |leaderboard| leaderboard.destroy }
            player.games.destroy_all
            player.destroy
            player = nil
        elsif event.x > 349 && event.x < 551 && event.y > 299 && event.y < 336
            close
        end
    end

end

update do
    if player
        name_capture.opacity = 0
        name_capture_label.opacity = 0
        name_capture_text.opacity = 0
        name_capture_text.text = ""
        first_place.opacity = 0
        first_place_label.opacity = 0
        second_place.opacity = 0
        second_place_label.opacity = 0
        third_place.opacity = 0
        third_place_label.opacity = 0
        fourth_place.opacity = 0
        fourth_place_label.opacity = 0
        fifth_place.opacity = 0
        fifth_place_label.opacity = 0
        sixth_place.opacity = 0
        sixth_place_label.opacity = 0
        seventh_place.opacity = 0
        seventh_place_label.opacity = 0
        eigth_place.opacity = 0
        eigth_place_label.opacity = 0
        ninth_place.opacity = 0
        ninth_place_label.opacity = 0
        tenth_place.opacity = 0
        tenth_place_label.opacity = 0
        back.opacity = 0
        back_label.opacity = 0
        if leaderboard_open
            first_place.opacity = 1
            first_place_label.opacity = 1
            first_place_label.text = "1: #{leaderboard_positions[0].game.player.name} #{leaderboard_positions[0].game.score.to_i}"
            second_place.opacity = 1
            second_place_label.opacity = 1
            second_place_label.text = "2: #{leaderboard_positions[1].game.player.name} #{leaderboard_positions[1].game.score.to_i}"
            third_place.opacity = 1
            third_place_label.opacity = 1
            third_place_label.text = "3: #{leaderboard_positions[2].game.player.name} #{leaderboard_positions[2].game.score.to_i}"
            fourth_place.opacity = 1
            fourth_place_label.opacity = 1
            fourth_place_label.text = "4: #{leaderboard_positions[3].game.player.name} #{leaderboard_positions[3].game.score.to_i}"
            fifth_place.opacity = 1
            fifth_place_label.opacity = 1
            fifth_place_label.text = "5: #{leaderboard_positions[4].game.player.name} #{leaderboard_positions[4].game.score.to_i}"
            sixth_place.opacity = 1
            sixth_place_label.opacity = 1
            sixth_place_label.text = "6: #{leaderboard_positions[5].game.player.name} #{leaderboard_positions[5].game.score.to_i}"
            seventh_place.opacity = 1
            seventh_place_label.opacity = 1
            seventh_place_label.text = "7: #{leaderboard_positions[6].game.player.name} #{leaderboard_positions[6].game.score.to_i}"
            eigth_place.opacity = 1
            eigth_place_label.opacity = 1
            eigth_place_label.text = "8: #{leaderboard_positions[7].game.player.name} #{leaderboard_positions[7].game.score.to_i}"
            ninth_place.opacity = 1
            ninth_place_label.opacity = 1
            ninth_place_label.text = "9: #{leaderboard_positions[8].game.player.name} #{leaderboard_positions[8].game.score.to_i}"
            tenth_place.opacity = 1
            tenth_place_label.opacity = 1
            tenth_place_label.text = "10: #{leaderboard_positions[9].game.player.name} #{leaderboard_positions[9].game.score.to_i}"
            back.opacity = 1
            back_label.opacity = 1
            new_game.opacity = 0
            new_game_label.opacity = 0
            leaderboard.opacity = 0
            leaderboard_label.opacity = 0
            change_player.opacity = 0
            change_player_label.opacity = 0
            delete_player.opacity = 0
            delete_player_label.opacity = 0
            quit.opacity = 0
            quit_label.opacity = 0
        elsif game
            clear
            score_label = Text.new("Score: #{game.score.to_i}")
            new_game.opacity = 0
            new_game_label.opacity = 0
            leaderboard.opacity = 0
            leaderboard_label.opacity = 0
            change_player.opacity = 0
            change_player_label.opacity = 0
            delete_player.opacity = 0
            delete_player_label.opacity = 0
            quit.opacity = 0
            quit_label.opacity = 0
            game.score += 0.2
            if game.score.to_i % 11 == 0
                game.score += 0.8
                enemy << Enemy.new
            end
            if player.player_collision?(enemy)
                puts "COLLISION"
                game.save
                Leaderboard.set_ranking
                game = Game.create(player: player, time_played: 0, score: 0, enemies_killed: 0, leaderboard: Leaderboard.create)
                player.x = 450
                player.y = 250
                enemy = []
            end
            player.draw
            enemy.each { |e| e.draw }
            enemy.each { |e| e.move }
        elsif !game
            new_game.opacity = 1
            new_game_label.opacity = 1
            leaderboard.opacity = 1
            leaderboard_label.opacity = 1
            change_player.opacity = 1
            change_player_label.opacity = 1
            delete_player.opacity = 1
            delete_player_label.opacity = 1
            quit.opacity = 1
            quit_label.opacity = 1
        end
    elsif !player
        new_game.opacity = 0
        new_game_label.opacity = 0
        leaderboard.opacity = 0
        leaderboard_label.opacity = 0
        change_player.opacity = 0
        change_player_label.opacity = 0
        delete_player.opacity = 0
        delete_player_label.opacity = 0
        quit.opacity = 0
        quit_label.opacity = 0
        name_capture.opacity = 1
        name_capture_label.opacity = 1
        name_capture_text.opacity = 1
    end
end

show