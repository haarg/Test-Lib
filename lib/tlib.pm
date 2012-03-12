package tlib;
use strict;
use warnings FATAL => 'all';
use File::Spec;
use Cwd ();

sub import {
    my $class = shift;
    my $dir = shift;
    if (! defined $dir) {
        my $file = File::Spec->rel2abs((caller)[1]);
        $dir = File::Spec->catpath((File::Spec->splitpath($file))[0,1], '');
    }
    my $i = 5;
    while ($i--) {
        my $tdir = File::Spec->catdir($dir, (File::Spec->updir) x $i);
        my $abs_path = Cwd::abs_path($tdir);
        my $dirname = (File::Spec->splitdir($abs_path))[-1];

        if ($dirname eq 't') {
            my $tlib = File::Spec->catdir($tdir, 'lib');
            if (-d $tlib) {
                lib->import($tlib);
                last;
            }
        }
    }
    die "unable to find t/lib directory";
}

1;