package MyDate;

use strict;
use warnings;

=head3 is_leap_year

  my $is_leap_year = MyDate->is_leap_year($year);
  
OO Subroutine. Pass in year and returns 1/0 depending on whether it's a leap year.

=cut

sub is_leap_year {
    my $class = shift;
    my $year = shift;

    return undef if(!defined $year);
	return undef if($year =~ m/\./);

    return 1 if($year % 400 == 0);
    return 0 if($year % 100 == 0);
    return 1 if($year % 4   == 0);
    return 0;
}


1;
