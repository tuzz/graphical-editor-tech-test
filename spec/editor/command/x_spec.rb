require "spec_helper"

RSpec.describe Editor::Command::X do
  it "terminates the session" do
    expect { subject.execute }.to raise_error(SystemExit)
  end
end
