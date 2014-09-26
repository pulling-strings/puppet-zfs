# settings up zfs user
class zfs::user {

  group{'zfs':
    ensure  => present
  } ->

  user{'zfs':
    ensure => present,
    groups => 'zfs',
  }

  file {'/etc/sudoers.d/zfs':
    ensure=> file,
    mode  => '0440',
    source=> 'puppet:///modules/zfs/sudo-zfs',
    owner => root,
    group => root,
  }

}
