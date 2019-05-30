require 'yaml'
# frozen_string_literal: true

# Class that allow you to work with .yml files
class Data
  def self.save(path, *data_hash)
    file = File.new(path, 'w')
    file.puts YAML.dump(data_hash)
    file.close
    puts 'Date saved!'
  end

  def self.load(path)
    file = File.new(path, 'r')
    YAML.load(file.read)
    file.close
    puts 'Data loaded!'
  end
end
