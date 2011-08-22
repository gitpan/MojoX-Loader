#!/usr/bin/env perl
use strict;
use lib qw(t lib ../lib ../mojo/lib ../../mojo/lib);

use MojoX::Loader;
use Data::Dumper;

use Test::More tests => 11;

my $new = MojoX::Loader->new;
isa_ok $new, 'MojoX::Loader';

my $self;

$self = MojoX::Loader->load;
isa_ok $self, 'Mojolicious::Controller';

$self = MojoX::Loader->load(controller => 'App::Test');
isa_ok $self, 'App::Test';

# call method

can_ok $self, 'foo';
is $self->foo, 'bar', 'The method foo returns bar';

# call attr of base module

my $conf = $self->app->conf;
is ref $conf, 'HASH', 'Conf is ref HASH';
is $conf->{foo}, 'bar', 'Valid value of foo conf\'s';

# call helper

is $self->conf('foo'), 'bar', 'Execute conf helper';

# call another base class with redefine dumper helper

$self = MojoX::Loader->load( app => 'App2', log => Mojo::Log->new(level => 'error') );
is $self->dumper, 'dumper', 'Redefine dumper helper';

# call render tmpl

is $self->render_partial('test'), "Test\n", 'Render test tmpl';

is $self->render_partial('index', i => 42), "Index tmpl file, stash i = 42.\n", 'Render index tmpl from disk';

__DATA__

@@ test.html.ep

Test
