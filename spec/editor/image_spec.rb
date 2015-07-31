require "spec_helper"

RSpec.describe Editor::Image do
  subject { described_class.new(width: 3, height: 2) }

  it "sets all pixels to white on initialization" do
    expect(subject.get(1, 1)).to eq("O")
    expect(subject.get(1, 2)).to eq("O")

    expect(subject.get(2, 1)).to eq("O")
    expect(subject.get(2, 2)).to eq("O")

    expect(subject.get(3, 1)).to eq("O")
    expect(subject.get(3, 2)).to eq("O")
  end

  it "lets you set pixel colors" do
    subject.set(1, 1, "A")
    subject.set(1, 2, "B")
    subject.set(3, 2, "C")

    expect(subject.get(1, 1)).to eq("A")
    expect(subject.get(1, 2)).to eq("B")
    expect(subject.get(3, 2)).to eq("C")
  end

  context "when initializing with an invalid width or height" do
    it "raises a helpful error" do
      expect {
        described_class.new(width: 0, height: 1)
      }.to raise_error(ArgumentError, /between 1 and 250/)

      expect {
        described_class.new(width: 1, height: 251)
      }.to raise_error(ArgumentError, /between 1 and 250/)
    end
  end

  context "when getting/setting an out-of-bounds pixel" do
    it "raises a helpful error" do
      expect {
        subject.get(0, 1)
      }.to raise_error(ArgumentError, /out of bounds/)

      expect {
        subject.get(1, 9)
      }.to raise_error(ArgumentError, /out of bounds/)
    end
  end
end
