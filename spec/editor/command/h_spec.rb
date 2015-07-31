require "spec_helper"

RSpec.describe Editor::Command::H do
  it "draws a horizontal segment of color c in row y between columns x1 and x2" do
    image = Editor::Image.new(width: 5, height: 5)
    output = StringIO.new

    image = subject.execute(x1: "2", x2: "4", y: "3", c: "A", image: image, output: output)

    expect(image.get(1, 3)).to eq("O")
    expect(image.get(2, 3)).to eq("A")
    expect(image.get(3, 3)).to eq("A")
    expect(image.get(4, 3)).to eq("A")
    expect(image.get(5, 3)).to eq("O")

    expect(image.get(3, 2)).to eq("O")
    expect(image.get(3, 4)).to eq("O")
  end
end
