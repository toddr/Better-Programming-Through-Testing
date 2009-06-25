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

=head3 day_of_week

    my $dow = MyDate->day_of_week($year, $month, $day);
    
pass YMD in and get back the day of the week.

$dow comes back as The name of the day of the week.

This spec only works on days after 1900-01-01

=cut

my @day_of_week = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);
my %days_this_year_by_month = qw(
    1  0
    2  31 
    3  59 
    4  89 
    5  120 
    6  151 
    7  181 
    8  211 
    9  243 
    10  273
    11 304 
    12 333 
);


my $jan1_1900_dow = 1;

sub  day_of_week {
    my $class = shift;
    my ($wants_year, $wants_month, $wants_day)  = @_;

    $wants_year > 1899 or die("year $wants_year is prior to 1900");

    # Calc years since $year_days
    my $year_days = ($wants_year - 1900) * 365; 
    for(1900..($wants_year-1)) {
        $year_days++ if($class->is_leap_year($_));
    }
    
    # Calc Days in months so far;
    my $month_days = $days_this_year_by_month{$wants_month};
    $month_days++ if($wants_month > 2 &&  $class->is_leap_year($wants_month));
    
    my $days_since_1900 = $year_days + $month_days + $wants_day;
    my $dow_found = $days_since_1900 % 7;
    
    return $day_of_week[$dow_found];
}

sub days_in_month { 
    my $class = shift;
    my ($year, $month) = @_;
    
    my %days_in_month = qw{
        1  31 
        2  28 
        3  31 
        4  30 
        5  31 
        6  30 
        7  31 
        8  31 
        9  30
        10  31 
        11 30 
        12 31
    };
    
    my $days = $days_in_month{$month};
    $days++ if($month == 2 && $class->is_leap_year($year)); #Leap year for Feb
    return  $days;
};

1;
