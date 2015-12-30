require 'yaml'

config = YAML.load_file( File.join( Rails.root, 'config', 'flexmod_config.yml' ) )
begin
  Flexgem::Comm.init config
rescue StandardError
  puts "Error configuring serial_port - Please check connection on specified port"
end
