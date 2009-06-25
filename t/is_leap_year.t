#!perl
use strict;
use warnings;

use Test::More;
use_ok('MyDate');

my %test_cases = (
    '0'    => 1,
    '0004' => 1,
    '0100' => 0,
    '0400' => 1,
    '1900' => 0,
	'1996' => 1,
	'1997' => 0,
	'1998' => 0,
	'1999' => 0,
	'2000' => 1,
	'2001' => 0,
	'2002' => 0,
	'2003' => 0,
	'2004' => 1,
);

# Test leap year bases on hash above. with year as key and value as true/false
for my $year (sort keys %test_cases) {
    my $want = $test_cases{$year};
    my $is_leap = MyDate->is_leap_year($year);
    my $expect_string = $test_cases{$year} ? 'true' : 'false';
    
	is(!!$is_leap, !!$want, "is_leap_year($year)");
}

is(MyDate->is_leap_year(undef), undef, "Undef comes back as undef to signify a possible error");
is(MyDate->is_leap_year(2004.1), undef, "Undef comes back as undef to signify a possible error for decimal years");

done_testing();