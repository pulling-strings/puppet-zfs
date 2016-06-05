# ZFS setup on Ubuntu (including send/recieve support over netcat).
class zfs {
  include zfs::user
  include zfs::sync

  # see http://askubuntu.com/questions/691576/zfs-broken-after-upgrading-to-15-10
  if versioncmp($::lsbdistrelease , '15.04') <= 0 {
    $zfs_package = 'ubuntu-zfs'

    apt::ppa{'ppa:zfs-native/stable':
    } ->

    package{$zfs_package:
      ensure  => present,
      require => Class['apt::update']
    }
  } else {
    $zfs_package = 'zfsutils-linux'

    apt::ppa{'ppa:zfs-native/stable':
      ensure => absent
    } ->

    package{'ubuntu-zfs':
      ensure  => absent,
      require => Class['apt::update']
    } ->

    package{$zfs_package:
      ensure  => present,
      require => Class['apt::update']
    }
  }

  file {'/etc/modprobe.d/zfs.conf' :
    ensure  => file,
    mode    => '0644',
    source  => 'puppet:///modules/zfs/zfs.conf',
    owner   => root,
    group   => root,
    require => Package[$zfs_package]
  } ->

  file { '/etc/udev/rules.d/91-zfs-permissions.rules':
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/zfs/91-zfs-permissions.rules',
    owner  => root,
    group  => root,
  }

}
