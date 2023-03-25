# Puppet to make changes to our configuration file
file { '/home/user/.ssh/config':
  ensure  => file,
  owner   => 'user',
  group   => 'user',
  mode    => '0600',
  content => "\
Host <server_ip>
  IdentityFile /home/user/.ssh/school
  IdentityFile /home/user/.ssh/id_rsa
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  ForwardAgent yes
"
}
