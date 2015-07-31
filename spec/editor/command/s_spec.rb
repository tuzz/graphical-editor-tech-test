require "spec_helper"

RSpec.describe Editor::Command::S do
  it "shows the contents of the current image" do
    io = StringIO.new
    image = Editor::Image.new(width: 1, height: 2)
    subject.execute(io: io, image: image)
    expect(io.string).to eq("O\nO\n")
  end
end

