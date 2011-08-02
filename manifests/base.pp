class roles::base {
	include apt
	include users
	include git
	include sudo
	include ec2
}

