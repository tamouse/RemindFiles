#!/usr/bin/perl -wn
#
# cal2rem
#
# Author: Tamara Temple <tamara@tamaratemple.com>
# Created: 2011/10/07
# Copyright (c) 2011 Tamara Temple Web Development
#

use strict;

my @months = qw{Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec};

chomp();

/^LANG/ && next;
/^#/ && next;

if (/^[0-9]/) # line begins with MM/DD
{
    my ($ds, @t) = split();
    my ($m, $d) = split(/\//,$ds);
    my $mn = $months[$m-1];
    printf("REM %s %s MSG %s\n",$mn,$d,join(" ",@t));
}
elsif (/^Easter/)
{
    my ($ds, $t) = split(/\t/);
    printf("REM %s MSG %s\n", $ds, $t);
}
elsif (/^[A-Za-z]/) # line begins with Mmm dd
{
    my $mn;
    my $dp;
    my ($ds, $t) = split(/\t/);
    if ($ds =~ m|/|) {
	($mn,$dp) = split(/\//,$ds); 
    } else {
	($mn,$dp) = split(/\s+/,$ds);
    }
    printf("REM %s %s MSG %s\n", $mn, $dp, $t);
}
elsif (/\/\*\s+(.*)\s+\*\//)
{
    printf("\n# %s\n",$1);
}
else
{
    # do nothing
}

	   
		

