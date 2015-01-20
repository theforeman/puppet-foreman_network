# Default params for foreman_network module
class foreman_network::params (
  $interface                 = undef,
  $ip                        = undef,
  $netmask                   = undef,
  $gateway                   = undef,
  $dns                       = undef,
  $ntp_host                  = undef,
  $configure_networking      = true,
  $configure_firewall_ssh    = true,
  $configure_firewall_dns    = true,
  $configure_firewall_dhcp   = true,
  $configure_firewall_tftp   = true,
  $configure_firewall_apache = true,
  $configure_firewall_puppet = true,
  $configure_firewall_purge  = false,
  $configure_ntpd            = true,
) {
}
