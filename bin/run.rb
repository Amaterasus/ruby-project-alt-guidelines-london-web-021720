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
    elsif name_capture_text.text.length > 15
            
    elsif event.key.length == 1
        name_capture_text.text += event.key
    end
    name_capture_text.text.capitalize!
end

show