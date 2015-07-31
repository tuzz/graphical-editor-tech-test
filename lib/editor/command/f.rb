module Editor
  module Command
    class F
      def self.execute(x:, y:, c:, image:, output:)
        x = Integer(x)
        y = Integer(y)

        current_color = image.get(x, y)
        color_to_set = c

        new(image, current_color, color_to_set).flood_fill(x, y)
        image
      end

      def initialize(image, current_color, color_to_set)
        self.image = image
        self.current_color = current_color
        self.color_to_set = color_to_set
      end

      def flood_fill(x, y)
        stack = []
        stack.push(x: x, y: y)

        until stack.empty?
          current = stack.pop
          x = current.fetch(:x)
          y = current.fetch(:y)

          next if out_of_bounds?(x, y)
          next if visited?(x, y)
          next if different_color?(x, y)

          image.set(x, y, color_to_set)

          stack.push(x: x - 1, y: y)
          stack.push(x: x + 1, y: y)
          stack.push(x: x, y: y - 1)
          stack.push(x: x, y: y + 1)
        end
      end

      private

      def out_of_bounds?(x, y)
        x < 1 || y < 1 || x > image.width || y > image.height
      end

      def visited?(x, y)
        @visited ||= {}

        if @visited.include?([x, y])
          true
        else
          @visited[[x, y]] = true
          false
        end
      end

      def different_color?(x, y)
        image.get(x, y) != current_color
      end

      attr_accessor :image, :current_color, :color_to_set
    end
  end
end
