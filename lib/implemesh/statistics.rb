
module Implemesh
  module Statistics

    def self.included(base)
      Dir[File.expand_path("../statistics/*.rb", __FILE__)].each do |file|
        require file
        base.send('include', self.const_get(File.basename(file).gsub('.rb','').split("_").map {|part| part.capitalize}.join))
      end
    end
  end
end