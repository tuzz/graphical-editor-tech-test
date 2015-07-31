require "spec_helper"

RSpec.describe Editor::Command::S do
  it "shows the contents of the current image" do
    image = Editor::Image.new(width: 1, height: 2)
    io = StringIO.new

    image = subject.execute(image: image, io: io)
    expect(io.string).to eq("O\nO\n")
  end
end

