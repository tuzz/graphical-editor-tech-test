require "spec_helper"

RSpec.describe Editor::Command::F do
  it "flood-fills the region starting at the given pixel" do
    image = Editor::Image.new(width: 7, height: 5)
    output = StringIO.new

    image.set(4, 1, "X")
    image.set(4, 2, "X")
    image.set(4, 3, "X")
    image.set(4, 4, "X")
    image.set(4, 5, "X")

    image = described_class.execute(x: "2", y: "3", c: "A", image: image, output: output)

    expect(image.get(1, 1)).to eq("A")
    expect(image.get(1, 5)).to eq("A")
    expect(image.get(3, 1)).to eq("A")
    expect(image.get(3, 5)).to eq("A")
    expect(image.get(2, 3)).to eq("A")

    expect(image.get(4, 3)).to eq("X")

    expect(image.get(5, 1)).to eq("O")
    expect(image.get(5, 5)).to eq("O")
    expect(image.get(7, 1)).to eq("O")
    expect(image.get(7, 5)).to eq("O")
    expect(image.get(6, 3)).to eq("O")
  end
end
