require 'rspec'
require 'pry'
require 'faker'
require 'appium_lib'
require 'selenium-webdriver'

device = ENV['DEVICE'] || 'Nexus'

base = ENV['EMULADOR'] || 'true'

if base == 'true'
    base_config = YAML.load_file('./config/emulators.yaml')['emulators'][device]
else
    base_config = YAML.load_file('./config/devices.yaml')['devices'][device]
end    
binding.pry

#Executar o Driver Appium:
Appium::Driver.new(base_config)
Appium.promote_appium_methods Object

