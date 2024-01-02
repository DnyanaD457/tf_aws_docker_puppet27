require 'spec_helper_acceptance'

describe 'docker-registry' do
  
  let(:manifests) {
    <<-EOS
      include role::docker_registry
    EOS
  }

  it 'installs the docker-registry package' do
    expect(package('docker-registry')).to be_installed
  end

  it 'enables and starts the docker-registry service' do
    expect(service('docker-registry')).to be_enabled
    expect(service('docker-registry')).to be_running
  end
end

describe file('/etc/docker/registry') do
  it { should be_directory}
end  

describe file('/etc/docker/registry/config.yml') do
  it { should exist}
end
