module Editor
  module Command
    module L
      def self.execute(x:, y:, c:, image:, io:)
        x = Integer(x)
        y = Integer(y)

        image.set(x, y, c)
        image
      end
    end
  end
end
