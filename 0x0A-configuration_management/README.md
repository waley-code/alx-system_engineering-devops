# Configuration management
## DevOps      SysAdmin     Scripting   CI/CD

configuration management tool allows one to manage infrastructure as code. It automates the provisioning, configuration, and management of systems, and helps in maintaining consistency and control across an entire infrastructure. Puppet is an open source tool that uses a declarative language to describe the desired state of systems, and provides tools to enforce that state automatically.

### Architecture
Puppet uses a client-server architecture, where the Puppet master server manages the configuration of client systems. The master server stores the configuration data and manifests, which define the desired state of the systems, and distributes them to the client systems. The client systems run the Puppet agent, which communicates with the Puppet master server to retrieve and apply the configuration

### Puppet Resources
Puppet uses the concept of resources to represent the various elements of a system that need to be managed. A resource is a piece of configuration that describes the desired state of a specific element of a system, such as a file, a package, or a service. Puppet provides a large number of built-in resource types, and also allows you to create your own custom resource types.

### Puppet Manifests
In Puppet, the desired state of a system is defined in a file called a manifest. A manifest is a collection of Puppet resources that describe the desired configuration of a system. Manifests are written in Puppet's declarative language, which allows you to specify the desired state of a system, rather than the steps required to achieve that state.

### Writing a Simple Manifest
Here's an example of a simple Puppet manifest that installs the Apache web server:

puppet
    package { 'apache2':
    ensure => 'installed',
    }

    service { 'apache2':
    ensure => 'running',
    enable => 'true',
    }
This manifest contains two resource types: package and service. The package resource type is used to install the apache2 package, and the service resource type is used to start and enable the apache2 service.

Applying a Manifest
To apply a manifest, you can use the puppet apply command. For example, to apply the manifest defined above, you would create a file called myapache.pp containing the manifest code, and then run the following command:
bash
    sudo puppet apply myapache.pp
This will apply the manifest and configure the Apache web server on the system.