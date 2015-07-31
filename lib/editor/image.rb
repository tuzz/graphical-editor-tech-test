module Editor
  class Image
    attr_reader :width, :height

    def initialize(width:, height:)
      self.width = width
      self.height = height
      self.data = Hash.new { |k, v| k[v] = Hash.new("O") }

      check_dimensions!
    end

    def get(x, y)
      check_bounds!(x, y)
      data[x][y]
    end

    def set(x, y, color)
      check_bounds!(x, y)
      data[x][y] = color
    end

    private

    def check_dimensions!
      unless (1..250).include?(width) && (1..250).include?(height)
        raise ArgumentError, "The width and height should be between 1 and 250"
      end
    end

    def check_bounds!(x, y)
      unless (1..width).include?(x) && (1..height).include?(y)
        raise ArgumentError, "The coordinate (#{x}, #{y}) is out of bounds"
      end
    end

    attr_accessor :data
    attr_writer :width, :height
  end
end
