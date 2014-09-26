# zfs send over netcat
class zfs::sync {
  package{'netcat':
    ensure  => present
  }

  file { '/usr/local/bin/zfs-recieve':
    ensure=> file,
    mode  => '0644',
    source=> 'puppet:///modules/zfs/zfs-recieve',
    owner => root,
    group => root,
  }
}
