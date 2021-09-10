PROJECT_ROOT = File.expand_path('..', __dir__)
module Config
  class Application
    
    def self.load(list, local)
      list.each { |file| require "#{PROJECT_ROOT}/#{local}/#{file}.rb" }
    end
  end
end
