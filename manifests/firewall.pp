# Configure firewall
class foreman_network::firewall {

  if $foreman_network::configure_firewall_purge {
    resource { 'firewall':
        purge => true,
    }
  }

  # The Foreman server should accept ssh connections for management.
  if $foreman_network::configure_firewall_ssh {
    firewall { '22 accept - ssh':
      dport  => '22',
      proto  => 'tcp',
      action => 'accept',
    }
  }

  # The Foreman server needs to accept DNS requests on this port for tcp and udp when provisioning systems.
  if $foreman_network::configure_firewall_dns {
    firewall { '53 accept - dns tcp':
      dport  => '53',
      proto  => 'tcp',
      action => 'accept',
    } ->
    firewall { '53 accept - dns udp':
      dport  => '53',
      proto  => 'udp',
      action => 'accept',
    }
  }

  # The Foreman server needs to accept DHCP and BOOTP requests on this port when provisioning systems.
  if $foreman_network::configure_firewall_dhcp {
    firewall { '67 accept - dhcp':
      dport  => '67',
      proto  => 'udp',
      action => 'accept',
    } ->
    firewall { '68 accept - bootp':
      dport  => '68',
      proto  => 'udp',
      action => 'accept',
    }
  }


  # The Foreman server needs to accept TFTP requests on this port when provisioning systems.
  if $foreman_network::configure_firewall_tftp {
    firewall { '69 accept - tftp':
      dport  => '69',
      proto  => 'udp',
      action => 'accept',
    }
  }

  # The Foreman web user interface accepts connections on these ports.
  if $foreman_network::configure_firewall_apache {
    firewall { '80 accept - apache':
      dport  => '80',
      proto  => 'tcp',
      action => 'accept',
    } ->
    firewall { '443 accept - apache':
      dport  => '443',
      proto  => 'tcp',
      action => 'accept',
    }
  }


  # The Foreman server accepts connections to Puppet on this port.
  if $foreman_network::configure_firewall_puppet {
    firewall { '8140 accept - puppetmaster':
      dport  => '8140',
      proto  => 'tcp',
      action => 'accept',
    }
  }
}
