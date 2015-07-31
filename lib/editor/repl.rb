module Editor
  module REPL
    def self.start
      image = nil

      loop do
        print "> "
        line = gets
        image = Command.execute(line, image, STDOUT)
      end
    end
  end
end
