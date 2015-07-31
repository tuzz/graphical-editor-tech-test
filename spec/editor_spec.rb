require "spec_helper"

RSpec.describe "Black-box test" do
  it "produces the correct output for the first example in the readme" do
    input = <<-INPUT
I 5 6
L 2 3 A
S
X
    INPUT

    expected = <<-OUTPUT
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
    OUTPUT

    actual = `echo '#{input}' | ./bin/editor`
    expect(actual).to include(expected)
  end

  it "produces the correct output for the second example in the readme" do
    input = <<-INPUT
I 5 6
F 3 3 J
V 2 3 4 W
H 3 4 2 Z
S
X
    INPUT

    expected = <<-OUTPUT
JJJJJ
JJZZJ
JWJJJ
JWJJJ
JJJJJ
JJJJJ
    OUTPUT

    actual = `echo '#{input}' | ./bin/editor`
    expect(actual).to include(expected)
  end

  describe "error handling" do
    it "traps errors and presents the message nicely" do
      actual = `echo 'FOO\nX\n' | ./bin/editor`
      expect(actual).to include('error: key not found: "FOO"')
    end

    it "does not throw an error for empty lines" do
      actual = `echo '\n\nX\n' | ./bin/editor`
      expect(actual).to_not include("error")
    end
  end
end
