module Editor
  module REPL
    def self.start
      image = nil

      loop do
        print "> "
        line = gets
        output = StringIO.new

        begin
          image = Command.execute(line, image, output)
          string = output.string
          puts string unless string.empty?
        rescue => e
          puts "error: #{e.message}"
        end
      end
    end
  end
end
