module Editor
  module Command
    module V
      def self.execute(x:, y1:, y2:, c:, image:)
        y1.upto(y2).each do |y|
          image.set(x, y, c)
        end
        image
      end
    end
  end
end
