#! /usr/bin/perl -w
# Build.PL: Installation configuration for Module::Build
use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    dist_name		=> "chklinks",
    dist_version_from	=> "chklinks",
    dist_abstract	=> "A non-threaded Perl link checker",
    dist_author		=> "imacat <imacat\@mail.imacat.idv.tw>",
    license		=> "gpl",
    sign		=> 1,
    
    script_files        => [ "chklinks" ],
    requires            => {
        "perl"			=> "5.6.0",
        "URI"			=> 0,
        "LWP::RobotUA"		=> 0,
        "HTTP::Cookies"		=> 0,
        "HTTP::Request"		=> 0,
        "HTML::LinkExtor"	=> 0
    },
    recommends		=> {
        "Crypt::SSLeay"		=> 0,
    },
    build_requires		=> {
        "Module::Signature"	=> 0,
        "Test::Pod"		=> 0,
    },
);

$build->create_build_script;

__END__
