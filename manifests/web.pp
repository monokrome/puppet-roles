class roles::web {
	include roles::base

	include nodejs
	include nodejs::npm
}

