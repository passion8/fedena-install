require 'yaml'
path = File.join(File.dirname(__FILE__), 'config/database.yml')
data = YAML.load_file path
data["production"]["password"] = ARGV[0]
File.open(path, 'w') { |f| YAML.dump(data, f) }
