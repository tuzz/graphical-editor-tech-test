require "spec_helper"

RSpec.describe Editor::Command::V do
  it "draws a vertical segment of color c in column x between rows y1 and y2" do
    image = Editor::Image.new(width: 5, height: 5)
    image = subject.execute(x: 3, y1: 2, y2: 4, c: "A", image: image)

    expect(image.get(3, 1)).to eq("O")
    expect(image.get(3, 2)).to eq("A")
    expect(image.get(3, 3)).to eq("A")
    expect(image.get(3, 4)).to eq("A")
    expect(image.get(3, 5)).to eq("O")

    expect(image.get(2, 3)).to eq("O")
    expect(image.get(4, 3)).to eq("O")
  end
end
