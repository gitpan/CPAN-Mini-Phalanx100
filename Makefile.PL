use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'CPAN::Mini::Phalanx100',
    AUTHOR              => 'Steve Peters <steve@fisharerojo.org>',
    VERSION_FROM        => 'lib/CPAN/Mini/Phalanx100.pm',
    ABSTRACT_FROM       => 'lib/CPAN/Mini/Phalanx100.pm',
    PL_FILES            => {},
    EXE_FILES           => [ qw(bin/minicpan-phalanx), ], 
    PREREQ_PM => {
        'Test::More' => 0,
        'CPAN::Mini' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'CPAN-Mini-Phalanx100-*' },
);
