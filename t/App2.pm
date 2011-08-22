package App2;
use Mojo::Base 'Mojolicious';

sub startup {
	my $self = shift;
	
	$self->renderer->root('t/tmpl');
	
	$self->log->level('error');
	
	$self->helper(dumper => sub { 'dumper' });
}

1;
