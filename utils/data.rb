require 'yaml'

class Data
  def self.save(path, *data_hash)
    file = File.new(path, 'w')
    file.puts YAML.dump(data_hash)
    file.close
  end

  def self.load(path)
    file = File.new(path, 'r')
    YAML.load(file.read)
    file.close
  end
end
