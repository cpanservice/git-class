package Git::Class::Role::Error;

use Any::Moose '::Role';
use Carp ();

has '_die_on_error' => (
  is       => 'rw',
  isa      => 'Bool',
  init_arg => 'die_on_error'
);

has 'is_verbose' => (
  is       => 'rw',
  isa      => 'Bool',
  init_arg => 'verbose',
);

has '_error' => (
  is      => 'rw',
  isa     => 'Str',
#  reader  => '_last_error',  # Mouse doesn't support reader yet
  trigger => sub {
    my ($self, $message) = @_;
    if ($message ne '') {
      chomp $message;
      $self->_die_on_error
        ? Carp::croak $message
        : Carp::carp  $message;
    }
  },
);

1;

__END__

=head1 NAME

Git::Class::Role::Error

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head1 AUTHOR

Kenichi Ishigaki, E<lt>ishigaki@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Kenichi Ishigaki.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
