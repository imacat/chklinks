#! /usr/bin/perl -w
# Basic test suite
# 
# Copyright (c) 2003-2007 imacat.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use 5.006;
use strict;
use Test;

BEGIN { plan tests => 21 }

use FindBin;
use File::Spec::Functions qw(catdir updir);
use File::Spec qw();
use lib $FindBin::Bin;
use vars qw($chklinks $start);
$chklinks = catdir($FindBin::Bin, updir, "blib", "script", "chklinks");
$start = catdir($FindBin::Bin, "htdocs", "dir01", "start.html");

# one level, locally, only below
eval {
    @_ = `$chklinks -1 -l -q $start`;
    $_ = join "", @_;
};
# 1
ok($@, "");
# 2
ok(scalar(@_), 1);
# 3
ok($_, qr/test02.html/);

# one level, locally, check parent
eval {
    @_ = `$chklinks -1 -l -p -q $start`;
    $_ = join "", @_;
};
# 4
ok($@, "");
# 5
ok(scalar(@_), 3);
# 6
ok($_, qr/test2.css/);
# 7
ok($_, qr/test02.html/);
# 8
ok($_, qr/test04.html/);

# recursive, locally, only below
eval {
    @_ = `$chklinks -l -q $start`;
    $_ = join "", @_;
};
# 9
ok($@, "");
# 10
ok(scalar(@_), 2);
# 11
ok($_, qr/test02.html/);
# 12
ok($_, qr/test3.css/);

# recursive, span remote, only below
eval {
    @_ = `$chklinks -q $start`;
    $_ = join "", @_;
};
# 13
ok($@, "");
# 14
ok(scalar(@_), 6);
# 15
ok($_, qr/test02\.html /);
s/^.*test02.html [^\n]*\n//m;
# 16
ok($_, qr/test3\.css /);
s/^.*test3.css [^\n]*\n//m;
# 17
ok($_, qr/^http:\/\/www\.yahoo\.com\/nonexistent /m);
s/^http:\/\/www\.yahoo\.com\/nonexistent [^\n]*\n//m;
# 18
ok($_, qr/^http:\/\/www\.domain\.invalid\/ /m);
s/^http:\/\/www\.domain\.invalid\/ [^\n]*\n//m;
# 19
ok($_, qr/^ftp:\/\/ftp\.cpan\.org\/nonexistent /m);
s/^ftp:\/\/ftp\.cpan\.org\/nonexistent [^\n]*\n//m;
# 20
ok($_, qr/^ftp:\/\/ftp\.domain\.invalid\/ /m);
s/^ftp:\/\/ftp\.domain\.invalid\/ [^\n]*\n//m;
# 21
ok($_, "");
