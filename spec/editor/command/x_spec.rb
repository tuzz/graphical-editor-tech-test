require "spec_helper"

RSpec.describe Editor::Command::X do
  it "terminates the session" do
    image = Editor::Image.new(width: 1, height: 2)
    output = StringIO.new

    expect { subject.execute(image: image, output: output) }.to raise_error(SystemExit)
  end
end
