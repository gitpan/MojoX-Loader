use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name         => 'MojoX::Loader',
	license             => 'perl',
	dist_author         => 'Anatoly Sharifulin <sharifulin@gmail.com>',
	dist_version_from   => 'lib/MojoX/Loader.pm',
	dist_abstract       => 'Loader of any Mojolicious Controller Modules in a standalone script',
	build_requires      => {},
	requires            => {
		'Mojolicious' => 1.31,
	},
	add_to_cleanup  => [],
	meta_merge => {
		resources => {
			repository => 'http://github.com/sharifulin/mojox-loader',
		},
		keywords => ['mojo', 'mojolicious', 'loader', 'controller'],
	},
	create_makefile_pl => 'traditional',
);

$builder->create_build_script();
