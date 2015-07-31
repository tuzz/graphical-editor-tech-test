module Editor
  module Command
    module C
      def self.execute(image:, io:)
        Image.new(width: image.width, height: image.height)
      end
    end
  end
end
