require "spec_helper"

RSpec.describe Editor::Command::C do
  it "clears the table, setting all pixels to white" do
    image = Editor::Image.new(width: 1, height: 2)
    io = StringIO.new

    image.set(1, 1, "A")
    image.set(1, 2, "B")

    image = subject.execute(image: image, io: io)

    expect(image.get(1, 1)).to eq("O")
    expect(image.get(1, 2)).to eq("O")
  end
end
