# Puppet to make changes to our configuration file

file { '~/.ssh/config':
  ensure  => file,
  owner   => 'uduntu',
  group   => 'ubuntu',
  mode    => '600',
  content => "\
Host *
  Hostname 54.174.243.255
  User ubuntu
  IdentityFile ~/.ssh/school
  PasswordAuthentication no"
}
