module Editor
  module Command
    module S
      def self.execute(io:, image:)
        1.upto(image.height) do |y|
          1.upto(image.width) do |x|
            color = image.get(x, y)
            io.write(color)
          end

          io.write("\n")
        end
      end
    end
  end
end
