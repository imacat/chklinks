#! /usr/bin/perl -w
# Basic test suite

# Copyright (c) 2003-2021 imacat.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use 5.006;
use strict;
use Test;

BEGIN { plan tests => 21 }

use FindBin;
use File::Spec::Functions qw(catdir updir);
use File::Spec qw();
use lib $FindBin::Bin;
our ($chklinks, $start);
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
ok($_, qr/^ftp:\/\/ftp\.domain\.invalid\/ /m);
s/^ftp:\/\/ftp\.domain\.invalid\/ [^\n]*\n//m;
# 18
ok($_, qr/^ftp:\/\/ftp\.gnu\.org\/nonexistent /m);
s/^ftp:\/\/ftp\.gnu\.org\/nonexistent [^\n]*\n//m;
# 19
ok($_, qr/^http:\/\/info\.cern\.ch\/nonexistent /m);
s/^http:\/\/info\.cern\.ch\/nonexistent [^\n]*\n//m;
# 20
ok($_, qr/^http:\/\/www\.domain\.invalid\/ /m);
s/^http:\/\/www\.domain\.invalid\/ [^\n]*\n//m;
# 21
ok($_, "");
