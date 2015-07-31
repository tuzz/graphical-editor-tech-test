module Editor
  module Command
    class F
      def self.execute(x:, y:, c:, image:)
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
        return if visited?(x, y)
        return unless image.get(x, y) == current_color

        image.set(x, y, color_to_set)

        left  = x - 1
        right = x + 1
        up    = y - 1
        down  = y + 1

        flood_fill(left, y) if left >= 1
        flood_fill(right, y) if right <= image.width
        flood_fill(x, up) if up >= 1 if up >= 1
        flood_fill(x, down) if down <= image.height
      end

      private

      def visited?(x, y)
        @visited ||= {}

        if @visited.include?([x, y])
          true
        else
          @visited[[x, y]] = true
          false
        end
      end

      attr_accessor :image, :current_color, :color_to_set
    end
  end
end
