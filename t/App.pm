package App;
use Mojo::Base 'Mojolicious';

has conf => sub { +{ foo => 'bar' } };

sub startup {
	my $self = shift;
	
	$self->helper(conf => sub { shift->app->conf->{+shift} });
}

1;
