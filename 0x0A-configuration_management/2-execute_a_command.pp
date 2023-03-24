# Puppet manifest that kills a process named killmenow using the pkill command

exec { 'killmenow':
  command => 'pkill killmenow',
  onlyif  => 'pgrep killmenow',
}
