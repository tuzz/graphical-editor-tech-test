module Editor
  module Command
    module S
      def self.execute(image:, io:)
        io.write("\n=>\n")
        1.upto(image.height) do |y|
          1.upto(image.width) do |x|
            color = image.get(x, y)
            io.write(color)
          end

          io.write("\n")
        end
        io.write("\n")

        image
      end
    end
  end
end
