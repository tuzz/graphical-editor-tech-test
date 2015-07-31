require "spec_helper"

RSpec.describe Editor::Command do
  let(:image) { double(:image) }
  let(:output) { double(:output) }

  it "routes 'I' commands correctly" do
    expect(described_class::I).to receive(:execute).with(m: "1", n: "2", image: image, output: output)
    described_class.execute("I 1 2", image, output)
  end

  it "routes 'C' commands correctly" do
    expect(described_class::C).to receive(:execute).with(image: image, output: output)
    described_class.execute("C", image, output)
  end

  it "routes 'L' commands correctly" do
    expect(described_class::L).to receive(:execute).with(x: "1", y: "2", c: "A", image: image, output: output)
    described_class.execute("L 1 2 A", image, output)
  end

  it "routes 'V' commands correctly" do
    expect(described_class::V).to receive(:execute).with(x: "1", y1: "2", y2: "3", c: "A", image: image, output: output)
    described_class.execute("V 1 2 3 A", image, output)
  end

  it "routes 'H' commands correctly" do
    expect(described_class::H).to receive(:execute).with(x1: "1", x2: "2", y: "3", c: "A", image: image, output: output)
    described_class.execute("H 1 2 3 A", image, output)
  end

  it "routes 'F' commands correctly" do
    expect(described_class::F).to receive(:execute).with(x: "1", y: "2", c: "A", image: image, output: output)
    described_class.execute("F 1 2 A", image, output)
  end

  it "routes 'S' commands correctly" do
    expect(described_class::S).to receive(:execute).with(image: image, output: output)
    described_class.execute("S", image, output)
  end

  it "routes 'X' commands correctly" do
    expect(described_class::X).to receive(:execute).with(image: image, output: output)
    described_class.execute("X", image, output)
  end

  it "strips leading and trailing whitespace" do
    expect(described_class::I).to receive(:execute).with(m: "1", n: "2", image: image, output: output)
    described_class.execute("  I   1   2  ", image, output)
  end
end
