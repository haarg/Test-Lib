use strict;
use Test::More tests => 1;

require_ok 'Test::Lib';

if (! Test::More->builder->is_passing) {
    BAIL_OUT("Module failed to load!");
}


