require 'yaml'

class Data
  def self.save(path, library)
    file = File.new(path, 'w')
    file.puts YAML.dump(library)
    file.close
  end

  def self.load(path)
    file = File.new(path, 'r')
    library = YAML.load(file.read)
    file.close
    library
  end
end
