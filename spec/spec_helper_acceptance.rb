require 'beaker-rspec'
require 'beaker-puppet'
require 'beaker/puppet_install_helper'


hosts.each do |host|
    install_puppet7
end

UNSUPPORTED_PLATFORMS = ['Solaris', 'AIX', 'windows', 'Suse']

RSpec.configure do |c|
    module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
    c.formatter = :documentation

    c.before :suite do 
      hosts.each do |host|
        copy_module_to(host, :source => module_root, :module_name => 'docker_registry')
        on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
       end
    end   


