Puppet Roles
============

What is it?
-----------

This is a puppet module which allows you to assign roles to nodes via a
configuration file (default is /etc/role) which can contain a string
representing the role that a specific agent performs. You can then
easily configure your agents by simply retreiving the contents of
that file with the 'role' fact.

How to use it?
--------------

This module helps a lot when you are virtualizing servers or otherwise
using agents that can't be identified via DNS or the hosts file. Instead,
you can simply set the contents of /etc/role to represent the role of the
agent.

For instance, you might have your web servers run this during initialization
using an init script, cloud init, kickstart, or something related to those:

    echo "web" > /etc/role

*NOTE:* If you would like a script that aids in the generation of cloud init
configurations composed of multiple types of scripts in the different
formats supported by cloud-init, take a look at [ec2-rolegen][1].

Now, if you have pluginsync set to true on your agents - you will be able to
access the *role* fact on your puppetmaster via the $role varialble.

Now, your site.pp can be as simple as the following in order to provide
the functionality of roles to all of your agents:

    if ($role != undef)
    {
        include "roles::${role}"
    }
    else
    {
        include roles::base
    }

*NOTE:* The preceding code will also make use of our base class when no
role has been specified. Although each specific role can choose to (or
not to) inherit or include this base class - it's nice for agents
without roles to also inherit some basic configuration so that you can
make use of them more quickly. This is especially useful when starting
up agents for performing quick maintenance.

An example of how you might want to start your role, and where roles
should exist is included in *manifests/example.pp*.

[1]: http://github.com/monokrome/ec2-rolegen	"EC2 Rolegen"

