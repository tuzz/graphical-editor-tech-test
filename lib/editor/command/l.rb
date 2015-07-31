module Editor
  module Command
    module L
      def self.execute(x:, y:, c:, image:)
        image.set(x, y, c)
        image
      end
    end
  end
end
