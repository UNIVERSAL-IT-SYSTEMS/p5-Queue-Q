#!/usr/bin/perl 
use strict;
use warnings;
use File::Slurper;

my @chunks;

for my $file (glob('*.lua')) {
    (my $key = $file) =~ s/\.lua$//;
    push @chunks, "\n$key => q{\n" . scalar read_text($file) . "}";
}
print '%scripts = (' , join(',', @chunks) , ");\n";
