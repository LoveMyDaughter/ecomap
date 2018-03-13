name "mysql"
description "MySQL Install"
run_list(
  "recipe[mysql::server]",
  "recipe[mysql::client]"
)
execute 'upgrade script' do
  command 'apt-get -y install python-pip && pip install --upgrade pip && pip install -r requirements.txt'
  action :run
end

