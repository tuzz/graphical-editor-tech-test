require "spec_helper"

RSpec.describe Editor::Command::I do
  it "creates a new M x N image with all pixels colored white" do
    image = Editor::Image.new(width: 1, height: 2)
    io = StringIO.new

    image = subject.execute(m: "1", n: "2", image: image, io: io)

    expect(image.width).to eq(1)
    expect(image.height).to eq(2)

    expect(image.get(1, 1)).to eq("O")
    expect(image.get(1, 2)).to eq("O")
  end
end
