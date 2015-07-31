require "spec_helper"

RSpec.describe Editor::Command::S do
  it "shows the contents of the current image" do
    image = Editor::Image.new(width: 1, height: 2)
    output = StringIO.new

    image = subject.execute(image: image, output: output)
    expect(output.string).to eq("\n=>\nO\nO\n\n")
  end
end

