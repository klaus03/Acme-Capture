package Acme::Capture;

use strict;
use warnings;

use Exporter ();
use Capture::Tiny;

#--------------------------------------------------------------------------#
# create API subroutines and export them
# [do STDOUT flag, do STDERR flag, do merge flag, do tee flag]
#--------------------------------------------------------------------------#

my %api = (
  capture         => [1,1,0,0],
  capture_stdout  => [1,0,0,0],
  capture_stderr  => [0,1,0,0],
  capture_merged  => [1,1,1,0],
  tee             => [1,1,0,1],
  tee_stdout      => [1,0,0,1],
  tee_stderr      => [0,1,0,1],
  tee_merged      => [1,1,1,1],
);

for my $sub (keys %api) {
    my $args = join q{, }, @{$api{$sub}};
    eval "sub $sub(&;@) { unshift \@_, $args; goto \\&Capture::Tiny::_capture_tee; }"; ## no critic
}

our @ISA = qw/Exporter/;
our @EXPORT_OK = keys %api;
our %EXPORT_TAGS = ( 'all' => \@EXPORT_OK );

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
