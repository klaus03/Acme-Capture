package Acme::Capture;

use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw(read_rdir) ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw();

sub new {
    my $pkg = shift;

    bless {}, $pkg;
}

1;

__END__

=head1 NAME

Acme::Capture - Use Capture::Tiny with a different _relayer() method

=head1 SYNOPSIS

  use Acme::Capture;

=head1 AUTHOR

Klaus Eichner, January 2016

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Klaus Eichner

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
