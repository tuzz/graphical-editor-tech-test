module Editor
  module Command
    module L
      def self.execute(x:, y:, c:, image:, output:)
        x = Integer(x)
        y = Integer(y)

        image.set(x, y, c)
        image
      end
    end
  end
end
