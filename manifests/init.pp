# ZFS setup on Ubuntu (including send/recieve support over netcat).
class zfs {
  ensure_resource('class','apt',{})
  include zfs::user
  include zfs::sync

  apt::ppa{'ppa:zfs-native/stable':} ->

  package{'ubuntu-zfs':
    ensure  => present
  } ->

  file {'/etc/modprobe.d/zfs.conf' :
    ensure=> file,
    mode  => '0644',
    source=> 'puppet:///modules/zfs/zfs.conf',
    owner => root,
    group => root,
  } ->

  file { '/etc/udev/rules.d/91-zfs-permissions.rules':
    ensure=> file,
    mode  => '0644',
    source=> 'puppet:///modules/zfs/91-zfs-permissions.rules',
    owner => root,
    group => root,
  }

}
