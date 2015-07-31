require "spec_helper"

RSpec.describe Editor::Command::X do
  it "terminates the session" do
    image = Editor::Image.new(width: 1, height: 2)
    io = StringIO.new

    expect { subject.execute(image: image, io: io) }.to raise_error(SystemExit)
  end
end
