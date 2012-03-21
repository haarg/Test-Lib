use strict;
use ExtUtils::MakeMaker 6.30;

my %WriteMakefileArgs = (
    'AUTHOR' => 'Graham Knop <haarg@haarg.org>',
    'BUILD_REQUIRES' => {
        'Test::More' => '0',
    },
    'CONFIGURE_REQUIRES' => {
        'ExtUtils::MakeMaker' => '6.30'
    },
    'DISTNAME' => 'tlib',
    'EXE_FILES' => [],
    'LICENSE' => 'perl',
    'NAME' => 'tlib',
    'ABSTRACT_FROM' => 'lib/tlib.pm',
    'VERSION_FROM' => 'lib/tlib.pm',
    'PREREQ_PM' => {
        'strict' => 0,
        'File::Spec' => 0,
        'Cwd' => 0,
    },
    'test' => {
        'TESTS' => join ' ', map { 't/' . join('/', ('*') x $_) . '.t' } 1..7,
    },
);

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
    my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
    my $pp = $WriteMakefileArgs{PREREQ_PM};
    for my $mod ( keys %$br ) {
        if ( exists $pp->{$mod} ) {
            $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
        }
        else {
            $pp->{$mod} = $br->{$mod};
        }
    }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
    unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

