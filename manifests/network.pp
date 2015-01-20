# Configure network interface
class foreman_network::network {
  if ($foreman_network::configure_networking) {
    class { 'network::global':
      gateway => $foreman_network::gateway,
    }

    network::if::static { $foreman_network::interface:
      ensure    => 'up',
      ipaddress => $foreman_network::ip,
      netmask   => $foreman_network::netmask,
      dns1      => $foreman_network::ip,
      dns2      => $foreman_network::dns,
      peerdns   => true,
    }

    host { $::fqdn:
      comment      => 'created by puppet class foreman_network',
      ip           => $foreman_network::ip,
      host_aliases => $foreman_network::hostname
    }
  }
}
