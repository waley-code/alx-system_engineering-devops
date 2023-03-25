# Puppet to make changes to our configuration file

file { '~/.ssh/config':
  ensure  => file,
  owner   => 'uduntu',
  group   => 'ubuntu',
  mode    => '0600',
  content => "\
Host 54.174.243.255
  Hostname 54.174.243.255
  User ubuntu
  IdentityFile ~/.ssh/id_rsa
  IdentityFile ~/.ssh/school
  PasswordAuthentication no"
}
