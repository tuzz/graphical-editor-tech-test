module Editor
  module Command
    module I
      def self.execute(m:, n:, image:, output:)
        m = Integer(m)
        n = Integer(n)

        Image.new(width: m, height: n)
      end
    end
  end
end
