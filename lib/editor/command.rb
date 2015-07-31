module Editor
  module Command
    class << self
      def execute(line, image, output)
        command, *args = line.strip.split
        mapping = command_map.fetch(command)

        params = Hash[mapping.args.zip(args)]
        params.merge!(image: image, output: output)

        mapping.command.execute(params)
      end

      private

      def command_map
        @command_map ||= {
          "I" => Mapping.new(I, [:m, :n]),
          "C" => Mapping.new(C),
          "L" => Mapping.new(L, [:x, :y, :c]),
          "V" => Mapping.new(V, [:x, :y1, :y2, :c]),
          "H" => Mapping.new(H, [:x1, :x2, :y, :c]),
          "F" => Mapping.new(F, [:x, :y, :c]),
          "S" => Mapping.new(S),
          "X" => Mapping.new(X)
        }
      end

      class Mapping
        attr_accessor :command, :args

        def initialize(command, args = [])
          self.command = command
          self.args = args
        end
      end
    end
  end
end
