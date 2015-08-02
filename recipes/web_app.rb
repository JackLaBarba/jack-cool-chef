include_recipe "apt::default"
include_recipe "nginx::default"

group "jack_cool"
include_recipe "user::data_bag"
