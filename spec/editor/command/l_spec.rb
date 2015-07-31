require "spec_helper"

RSpec.describe Editor::Command::L do
  it "colors the pixel (x, y) with color c" do
    image = Editor::Image.new(width: 1, height: 2)
    output = StringIO.new

    image = subject.execute(x: "1", y: "2", c: "A", image: image, output: output)
    expect(image.get(1, 2)). to eq("A")
  end
end
