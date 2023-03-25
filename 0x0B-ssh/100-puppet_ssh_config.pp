# Puppet to make changes to our configuration file
file { '~/.ssh/config':
  ensure  => file,
  mode    => '0600',
  content => "\
Host 54.174.243.255
    Hostname 54.174.243.255
    IgnoreUnkown AddKeysToAgent,UseKeychain
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/school
    IdentityFile ~/.ssh/id_rsa
    PasswordAuthentication no"
}
