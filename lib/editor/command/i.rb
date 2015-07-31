module Editor
  module Command
    module I
      def self.execute(m:, n:)
        Image.new(width: m, height: n)
      end
    end
  end
end
