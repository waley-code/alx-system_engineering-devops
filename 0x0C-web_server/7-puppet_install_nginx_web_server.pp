class nginx_server {
  package { 'nginx':
    ensure => installed,
  }

  file { '/var/www/html/index.html':
    content => 'Hello World!',
  }

  file { '/etc/nginx/sites-available/default':
    content => template('nginx_server/default.erb'),
  }

  file { '/etc/nginx/sites-enabled/default':
    ensure  => 'link',
    target  => '/etc/nginx/sites-available/default',
    require => File['/etc/nginx/sites-available/default'],
  }

  file { '/usr/share/nginx/html/404.html':
    content => 'Ceci n\'est pas une page',
  }

  file { '/etc/nginx/nginx.conf':
    content => template('nginx_server/nginx.conf.erb'),
    notify  => Service['nginx'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => [
      File['/etc/nginx/sites-available/default'],
      File['/etc/nginx/nginx.conf'],
    ],
  }
}

class { 'nginx_server': }

# Redirect /redirect_me to GitHub
nginx::resource::server { 'default':
  listen_port => 80,
  server_name => '_',
  rewrite     => [
    '^/redirect_me https://github.com/waley-code permanent',
  ],
  error_pages => {
    '404' => '/404.html',
  },
}
