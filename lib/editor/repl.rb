module Editor
  module REPL
    def self.start
      image = nil

      loop do
        print "> "
        line = gets
        begin
          image = Command.execute(line, image, STDOUT)
        rescue => e
          puts "error: #{e.message}"
        end
      end
    end
  end
end
