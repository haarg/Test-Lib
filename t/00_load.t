use strict;
use Test::More tests => 1;

require_ok 'tlib';

if (! Test::More->builder->is_passing) {
    BAIL_OUT("Module failed to load!");
}


