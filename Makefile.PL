#! /usr/bin/perl -w
# Makefile.PL: Installation configuration for ExtUtils::MakeMaker
use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

# Optional prerequisite modules
our (%OPT_PREREQ);
%OPT_PREREQ = (
    "Crypt::SSLeay"	=> 0,
);
delete $OPT_PREREQ{$_}
    foreach grep eval "use $_ $OPT_PREREQ{$_} qw(); 1;", sort keys %OPT_PREREQ;
if (keys %OPT_PREREQ > 0) {
    $_ = join " ", sort keys %OPT_PREREQ;
    warn << "EOT";
-- Optional Prerequisites
You may wish to install these modules altogether.
  $_
EOT
}

WriteMakefile(
    NAME		=> "chklinks",
    VERSION_FROM	=> "chklinks",
    ABSTRACT		=> "A non-threaded Perl link checker",
    AUTHOR		=> "imacat <imacat\@mail.imacat.idv.tw>",
    LICENSE		=> "apache_2_0",
    PREREQ_PM		=> {
        "URI"			=> 0,
        "LWP::RobotUA"		=> 0,
        "HTTP::Cookies"		=> 0,
        "HTTP::Request"		=> 0,
        "HTML::LinkExtor"	=> 0,
    },
    SIGN		=> 1,
    
    EXE_FILES		=> [ "chklinks" ],
    dist		=> {
        COMPRESS	=> "gzip -9",
        SUFFIX		=> ".gz",
    },
);

__END__
