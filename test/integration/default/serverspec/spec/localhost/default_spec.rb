require ::File.expand_path('../../spec_helper', __FILE__)

describe user('rocketchat') do
  it { should exist }
  it { should belong_to_group 'rocketchat' }
  it { should have_home_directory '/srv/rocketchat' }
  it { should have_login_shell '/bin/false' }
end

describe file('/srv/rocketchat') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_grouped_into 'rocketchat' }
  it { should be_owned_by 'rocketchat' }
end

describe file('/srv/rocketchat/main.js') do
  it { should be_file }
  it { should be_mode 444 }
  it { should be_owned_by 'rocketchat' }
  it { should be_grouped_into 'rocketchat' }
end

describe process('node main.js') do
  its(:user) { should eq 'rocketchat' }
end
