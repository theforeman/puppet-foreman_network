# Configure NTP daemon
class foreman_network::ntpd {
  if ($foreman_network::configure_ntpd) {

    package { ['ntp', 'ntpdate']:
      ensure => installed,
    } ~>
    exec { 'NTP sync':
      command     => "service ntpd stop; ntpdate ${foreman_network::ntp_host}",
      path        => ['/sbin', '/usr/sbin'],
      refreshonly => true,
    } ~>
    service { 'ntpd':
      ensure => running,
      enable => true,
    }

  }
}
