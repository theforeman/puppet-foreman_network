# Configure networking
class foreman_network::config {
  class { 'foreman_network::network': } ->
  class { 'foreman_network::firewall': } ->
  class { 'foreman_network::ntpd': }

  include foreman_network::network
  include foreman_network::firewall
  include foreman_network::ntpd
}
