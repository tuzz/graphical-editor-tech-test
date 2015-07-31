module Editor
  module Command
    module S
      def self.execute(image:, output:)
        output.write("\n=>\n")
        1.upto(image.height) do |y|
          1.upto(image.width) do |x|
            color = image.get(x, y)
            output.write(color)
          end

          output.write("\n")
        end
        output.write("\n")

        image
      end
    end
  end
end
