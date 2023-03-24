# Puppet manifest that kills a killmenow using the pkill command

exec { 'killmenow':
  command => 'pkill killmenow',
  onlyif  => 'pgrep killmenow',
}
