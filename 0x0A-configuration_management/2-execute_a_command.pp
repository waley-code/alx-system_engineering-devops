# Puppet manifest that kills a killmenow using the pkill command

exec { 'killmenow':
  path    => '/usr/bin/',
  command => 'pkill killmenow',
  onlyif  => 'pgrep killmenow',
}
