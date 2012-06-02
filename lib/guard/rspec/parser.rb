require 'ripper'

module Guard
  class RSpec
    class Parser < Ripper
      def self.syntax_check(filename)
        ripper = Parser.new(File.read(filename), filename)
        ripper.parse
      end

      def parse()
        @errors = []
        super
        @errors.empty?
      end
      attr_reader :errors

      private
      def compile_error(msg)
        @errors.push(msg)
      end
    end
  end
end
