require_relative '../config/environment'

set title: "Release The swarm",
    width: 900,
    height: 500,
    background: "teal"

player = nil

name_capture = Rectangle.new(
    width: 200, height: 75,
    x: 350, y: 200,
    color: 'aqua',
    z: 20)

name_capture_label = Text.new("Username:", color: "orange", x: name_capture.x + 45 , y: name_capture.y, z: name_capture.z * 2)
name_capture_text = Text.new("", color: "orange", x: name_capture.x + 20 , y: name_capture.y + 30, z: name_capture.z * 2)

on :key_up do |event|
    if player

    elsif event.key == "backspace"
        name_capture_text.text = name_capture_text.text.delete_suffix(name_capture_text.text.last)
    elsif name_capture_text.text.length > 2 && event.key == "return"
        player = Player.find_or_create_by(name: name_capture_text.text)
        name_capture.remove
        name_capture_label.remove
        name_capture_text.remove
        name_capture_text.text = ""
        new_game = Rectangle.new( width: 200, height: 35, x: 350, y: 100, color: 'aqua', z: 20)
        new_game_label = Text.new("New game", color: "orange", x: new_game.x + 55 , y: new_game.y, z: new_game.z * 2)
        leaderboard = Rectangle.new( width: 200, height: 35, x: 350, y: 150, color: 'aqua', z: 20)
        leaderboard_label = Text.new("Leaderboard", color: "orange", x: leaderboard.x + 45 , y: leaderboard.y, z: leaderboard.z * 2)
        change_player = Rectangle.new( width: 200, height: 35, x: 350, y: 200, color: 'aqua', z: 20)
        change_player_label = Text.new("Change player", color: "orange", x: change_player.x + 40 , y: change_player.y, z: change_player.z * 2)
        delete_player = Rectangle.new( width: 200, height: 35, x: 350, y: 250, color: 'aqua', z: 20)
        delete_player_label = Text.new("Delete player", color: "orange", x: delete_player.x + 45 , y: delete_player.y, z: delete_player.z * 2)
        quit = Rectangle.new( width: 200, height: 35, x: 350, y: 300, color: 'aqua', z: 20)
        quit_label = Text.new("Quit", color: "orange", x: quit.x + 85 , y: quit.y, z: quit.z * 2)
    elsif name_capture_text.text.length > 15
            
    elsif event.key.length == 1
        name_capture_text.text += event.key
    end
    name_capture_text.text.capitalize!
end

on :mouse_down do |event|
    puts event.x, event.y
    if player
        if event.x > 349 && event.x < 551 && event.y > 199 && event.y < 236
            player = nil
            new_game.remove
            new_game_label.remove
            leaderboard.remove
            leaderboard_label.remove
            change_player.remove
            change_player_label.remove
            delete_player.remove
            delete_player_label.remove
            quit.remove
            quit_label
        elsif event.x > 349 && event.x < 551 && event.y > 249 && event.y < 286
            player.destroy
        end
    end

end

show