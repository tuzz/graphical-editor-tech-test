module Editor
  module Command
    module V
      def self.execute(x:, y1:, y2:, c:, image:, io:)
        x = Integer(x)
        y1 = Integer(y1)
        y2 = Integer(y2)

        y1.upto(y2).each do |y|
          image.set(x, y, c)
        end
        image
      end
    end
  end
end
