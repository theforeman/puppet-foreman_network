# Configures networking according to values gathered by wizard, it does following actions
#   * configures gateway
#   * configures interface's IP address, netmask and DNS servers
#   * adds hosts record if missing
#   * configures firewall in a non-destructive way (leaves all existing rules untouched)
#   * configures ntpd
#
# === Parameters:
#
# $interface::            Which interface should this class configure
#
# $ip::                   What IP address should be set
#
# $netmask::              What netmask should be set
#
# $gateway::              What is the gateway for this machine
#
# $dns::                  DNS forwarder to use as secondary nameserver
#
# $ntp_host::             NTP sync host
#
# $configure_networking:: Should we modify networking?
#                         type:boolean
#
# $configure_firewall_ssh::   Should we allow ssh in firewall?
#                         type:boolean
#
# $configure_firewall_dns::   Should we allow dns in firewall?
#                         type:boolean
#
# $configure_firewall_dhcp::   Should we allow dhcp in firewall?
#                         type:boolean
#
# $configure_firewall_tftp::   Should we allow tftp in firewall?
#                         type:boolean
#
# $configure_firewall_apache::   Should we allow apache in firewall?
#                         type:boolean
#
# $configure_firewall_puppet::   Should we allow puppet in firewall?
#                         type:boolean
#
# $configure_firewall_purge::   Should we purge unmanaged firewall resources?
#                         type:boolean
#
# $configure_ntpd::       Should we modify ntpd?
#                         type:boolean
#
class foreman_network (
  $interface                 = $::foreman_network::params::interface,
  $ip                        = $::foreman_network::params::ip,
  $netmask                   = $::foreman_network::params::netmask,
  $gateway                   = $::foreman_network::params::gateway,
  $dns                       = $::foreman_network::params::dns,
  $ntp_host                  = $::foreman_network::params::ntp_host,
  $configure_networking      = $::foreman_network::params::configure_networking,
  $configure_firewall_ssh    = $::foreman_network::params::configure_firewall_ssh,
  $configure_firewall_dns    = $::foreman_network::params::configure_firewall_dns,
  $configure_firewall_dhcp   = $::foreman_network::params::configure_firewall_dhcp,
  $configure_firewall_tftp   = $::foreman_network::params::configure_firewall_tftp,
  $configure_firewall_apache = $::foreman_network::params::configure_firewall_apache,
  $configure_firewall_puppet = $::foreman_network::params::configure_firewall_puppet,
  $configure_firewall_purge  = $::foreman_network::params::configure_firewall_purge,
  $configure_ntpd            = $::foreman_network::params::configure_ntpd,
) inherits foreman_network::params {

  validate_bool($foreman_network::configure_networking)
  validate_bool($foreman_network::configure_firewall_ssh)
  validate_bool($foreman_network::configure_firewall_dns)
  validate_bool($foreman_network::configure_firewall_dhcp)
  validate_bool($foreman_network::configure_firewall_tftp)
  validate_bool($foreman_network::configure_firewall_apache)
  validate_bool($foreman_network::configure_firewall_puppet)
  validate_bool($foreman_network::configure_firewall_purge)
  validate_bool($foreman_network::configure_ntpd)


  class { '::foreman_network::config': } ->
  Class ['::foreman_network']

  include foreman_network::config

}
