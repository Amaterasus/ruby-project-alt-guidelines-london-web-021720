require_relative '../config/environment'

set title: "Release The swarm",
    width: 900,
    height: 500,
    background: "teal"

name_capture = Rectangle.new(
  x: 350, y: 200,
  width: 200, height: 75,
  color: 'aqua',
  z: 20
  
)
name_capture_label = Text.new("Name", color: "orange", x: name_capture.x + 70 , y: name_capture.y, z: name_capture.z * 2)
name_capture_text = Text.new("", color: "orange", x: name_capture.x + 20 , y: name_capture.y + 30, z: name_capture.z * 2)


on :key_up do |event|
    if event.key == "backspace"
        name_capture_text.text = name_capture_text.text.delete_suffix(name_capture_text.text.last).capitalize
    elsif name_capture_text.text.length > 15

    elsif event.key.length == 1
        name_capture_text.text += event.key
    end
end



show