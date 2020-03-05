require_relative '../config/environment'

set title: "Release The swarm",
    width: 900,
    height: 500,
    background: "teal",
    boarderless: true

player = nil
game = nil
enemy = []

name_capture = Rectangle.new(
    width: 200, height: 75,
    x: 350, y: 200,
    color: 'aqua',
    z: 20)

name_capture_label = Text.new("Username:", color: "orange", x: name_capture.x + 45 , y: name_capture.y, z: name_capture.z * 2)
name_capture_text = Text.new("", color: "orange", x: name_capture.x + 20 , y: name_capture.y + 30, z: name_capture.z * 2)
new_game = Rectangle.new( width: 200, height: 35, x: 350, y: 100, color: 'aqua', z: 20, opacity: 0)
new_game_label = Text.new("New game", color: "orange", x: new_game.x + 55 , y: new_game.y, z: new_game.z * 2, opacity: 0)
leaderboard = Rectangle.new( width: 200, height: 35, x: 350, y: 150, color: 'aqua', z: 20, opacity: 0)
leaderboard_label = Text.new("Leaderboard", color: "orange", x: leaderboard.x + 45 , y: leaderboard.y, z: leaderboard.z * 2, opacity: 0)
change_player = Rectangle.new( width: 200, height: 35, x: 350, y: 200, color: 'aqua', z: 20, opacity: 0)
change_player_label = Text.new("Change player", color: "orange", x: change_player.x + 40 , y: change_player.y, z: change_player.z * 2, opacity: 0)
delete_player = Rectangle.new( width: 200, height: 35, x: 350, y: 250, color: 'aqua', z: 20, opacity: 0)
delete_player_label = Text.new("Delete player", color: "orange", x: delete_player.x + 45 , y: delete_player.y, z: delete_player.z * 2, opacity: 0)
quit = Rectangle.new( width: 200, height: 35, x: 350, y: 300, color: 'aqua', z: 20, opacity: 0)
quit_label = Text.new("Quit", color: "orange", x: quit.x + 85 , y: quit.y, z: quit.z * 2, opacity: 0)

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
    puts event.x, event.y
    if player
        if game

        elsif event.x > 349 && event.x < 551 && event.y > 99 && event.y < 136
            game = Game.create(player: player)
            enemy << Enemy.new()
        elsif event.x > 349 && event.x < 551 && event.y > 149 && event.y < 186
            
        elsif event.x > 349 && event.x < 551 && event.y > 199 && event.y < 236
            player = nil
        elsif event.x > 349 && event.x < 551 && event.y > 249 && event.y < 286
            player.games.destroy_all
            player.destroy
            player = nil
        elsif event.x > 349 && event.x < 551 && event.y > 299 && event.y < 336
            close
        end
    end

end

update do
    if player && game
        clear
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
        player.draw
        enemy.each { |e| e.draw}
    elsif player
        name_capture.opacity = 0
        name_capture_label.opacity = 0
        name_capture_text.opacity = 0
        name_capture_text.text = ""
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