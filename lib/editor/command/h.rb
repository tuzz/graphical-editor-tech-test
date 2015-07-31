module Editor
  module Command
    module H
      def self.execute(x1:, x2:, y:, c:, image:, output:)
        x1 = Integer(x1)
        x2 = Integer(x2)
        y = Integer(y)

        x1.upto(x2).each do |x|
          image.set(x, y, c)
        end
        image
      end
    end
  end
end
