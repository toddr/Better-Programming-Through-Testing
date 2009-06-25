#!perl
use strict;
use warnings;

use Test::More;
use_ok('MyDate');

my %test_cases = qw{
    0     1
    0004  1
	1996  1
	1997  0
	1998  0
	1999  0
	2000  1
	2001  0
	2002  0
	2003  0
	2004  1 
};

for my $year (sort keys %test_cases) {
	is($test_cases{$year}, MyDate->is_leap_year($year), "Test Leap year for $year should be $test_cases{$year}");
}

is(MyDate->is_leap_year(undef), undef, "Undef comes back as undef to signify a possible error");
is(MyDate->is_leap_year(2004.1), undef, "Undef comes back as undef to signify a possible error for decimal years");

done_testing();