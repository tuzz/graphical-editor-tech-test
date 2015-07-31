require "spec_helper"

RSpec.describe Editor::Command::I do
  it "creates a new M x N image with all pixels colored white" do
    image = subject.execute(m: 1, n: 2)

    expect(image.width).to eq(1)
    expect(image.height).to eq(2)

    expect(image.get(1, 1)).to eq("O")
    expect(image.get(1, 2)).to eq("O")
  end
end
