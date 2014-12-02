require 'open3'
require 'json'
require 'tilt/template'

module Tilt
  class PHPTemplate < Template
    self.default_mime_type = 'text/x-php'

    def self.engine_initialized?
      true
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      Open3.popen3("php") do |stdin, stdout, stderr|
        locals[:yield] = yield if block_given?

        locals.each do |key, value|
          stdin.puts "<?php $#{key} = json_decode(\"#{value.to_json.gsub('"', '\"')}\"); ?>"
        end

        stdin.puts data
        stdin.close

        error = stderr.read
        raise error.to_s unless error.empty?

        stdout.read
      end
    end
  end
end

