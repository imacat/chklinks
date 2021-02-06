`chklinks` - A Non-Threaded Perl Link Checker
=============================================


Description
-----------

`chklinks` is a non-threaded Perl link checker.  It helps to find
broken links on your website.

`chklinks` differs from [linkchecker] in that `chklinks` is
non-threaded.  It does not raise many simultaneously connections for
its job.  It won’t run out of the resources and crash your system in a
moment.  This is certainly more desirable for most webmasters and
users.

`chklinks` respects `robots.txt`.  If you disallow robots from your
website and experience problems, you need to allow `chklinks`.  Add
the following lines to your `robots.txt` file to allow `chklinks`:

    User-agent: chklinks
    Disallow:

`chklinks` uses [LWP::RobotUA] and supports the following schemes:
`http`, `https`, `ftp`, `gopher` and `file`.  You can also specify a
local file.  (To use `https`, you need to install [Crypt::SSLeay].
This is the requirement of LWP::RobotUA.)

`chklinks` supports cookies.

[linkchecker]: https://wummel.github.io/linkchecker
[LWP::RobotUA]: https://metacpan.org/pod/LWP::RobotUA
[Crypt::SSLeay]: https://metacpan.org/release/Crypt-SSLeay


System Requirement
------------------

1. Perl, version 5.6 or above.  I have not successfully run this on
   earlier versions.  Please tell me if you can.  You can run
   `perl -v` to see your current Perl version.  If you do not have
   Perl, or if you have an older version of Perl, you can download and
   install/upgrade it from the [Perl website].  If you are using
   MS-Windows, you can download and install [ActiveState ActivePerl].

2. Required Perl modules:

   * [URI]

     This is used to parse and process the found URLs.  You can
     download and install URI from the CPAN archive, or install it
     with the CPAN shell:

         cpan URI

     or with the CPANPLUS shell:

         cpanp i URI

     For Debian/Ubuntu:

         sudo apt install liburi-perl

     For Red Hat/Fedora/CentOS:

         sudo yum install perl-URI

     For FreeBSD:

         ports install p5-URI

     For ActivePerl:

         ppm install URI

   * [HTML::LinkExtor]

     This is used to extract links from the web pages.
     HTML::LinkExtor is contained in the [HTML-Parser] distribution.
     You can download and install HTML::LinkExtor from the CPAN
     archive, or install it with the CPAN shell:

         cpan HTML::LinkExtor

     or with the CPANPLUS shell:

         cpanp i HTML::LinkExtor

     For Debian/Ubuntu:

         sudo apt install libhtml-parser-perl

     For Red Hat/Fedora/CentOS:

         sudo yum install perl-HTML-Parser

     For FreeBSD:

         ports install p5-HTML-Parser

     For ActivePerl:

         ppm install HTML-Parser

   * [LWP::RobotUA]

     This is used to request web pages.  LWP::RobotUA is contained in
     the [libwww-perl] distribution.  You can download and install
     LWP::RobotUA from the CPAN archive, or install it with the CPAN
     shell:

         cpan LWP::RobotUA

     or with the CPANPLUS shell:

         cpanp i HTML::LinkExtor

     For Debian/Ubuntu:

         sudo apt install libwww-perl

     For Red Hat/Fedora/CentOS:

         sudo yum install perl-libwww-perl

     For FreeBSD:

         ports install p5-libwww

     For ActivePerl:

         ppm install libwww-perl

3. Optional Perl modules:

   * [Crypt::SSLeay]

     This is needed by LWP::RobotUA to support HTTPS.  You can
     download and install HTML::LinkExtor from the CPAN archive, or
     install it with the CPAN shell:

         cpan Crypt::SSLeay

     or with the CPANPLUS shell:

         cpanp i Crypt::SSLeay

     For Debian/Ubuntu:

         sudo apt install libcrypt-ssleay-perl

     For Red Hat/Fedora/CentOS:

         sudo yum install perl-Crypt-SSLeay

     For FreeBSD:

         ports install p5-Crypt-SSLeay

     For ActivePerl:

         ppm install Crypt-SSLeay

[Perl website]: https://www.perl.org
[ActiveState ActivePerl]: https://www.activestate.com
[URI]: https://metacpan.org/release/URI
[HTML::LinkExtor]: https://metacpan.org/pod/HTML::LinkExtor
[HTML-Parser]: https://metacpan.org/release/HTML-Parser
[LWP::RobotUA]: https://metacpan.org/pod/LWP::RobotUA
[libwww-perl]: https://metacpan.org/release/libwww-perl
[Crypt::SSLeay]: https://metacpan.org/release/Crypt-SSLeay


Download
--------

`chklinks` is hosted is on…

* [chklinks project on GitHub]

* [chklinks project on SourceForge]

You can always download the newest version of `chklinks` from…

* [chklinks download on SourceForge]

* [Tavern IMACAT’s FTP directory]

imacat’s PGP public key is at…

* [imacat’s PGP key at Tavern IMACAT’s]

[chklinks project on GitHub]: https://github.com/imacat/chklinks
[chklinks project on SourceForge]: https://sf.net/p/chklinks
[chklinks download on SourceForge]: https://sourceforge.net/projects/chklinks/files
[Tavern IMACAT’s FTP directory]: https://ftp.imacat.idv.tw/pub/chklinks/
[imacat’s PGP key at Tavern IMACAT’s]: https://www.imacat.idv.tw/me/pgpkey.asc


Install
-------

`chklinks` uses standard Perl installation with ExtUtils::MakeMaker.
Follow these steps:

    % perl Makefile.PL
    % make
    % make test
    % make install

When running `make install`, make sure you have the privilege to
write to the installation location.  This usually requires the `root`
privilege.

If you are using ActivePerl under MS-Windows, you should use `nmake`
instead of `make`.  [nmake can be obtained from the Microsoft FTP site.]

If you want to install into another location, you can set the
`PREFIX`.  For example, to install into your home when you are not
`root`:

    % perl Makefile.PL PREFIX=/home/jessica

Refer to the documentation of ExtUtils::MakeMaker for more
installation options (by running `perldoc ExtUtils::MakeMaker`).

### Install with [Module::Build]

You can install with Module::Build instead, if you prefer.  Follow
these steps:

    % perl Build.PL
    % ./Build
    % ./Build test
    % ./Build install

When running `./Build install`, make sure you have the privilege to
write to the installation location.  This usually requires the `root`
privilege.

If you want to install into another location, you can set the
`--prefix`.  For example, to install into your home when you are not
`root`:

    % perl Build.PL --prefix=/home/jessica

Refer to the documentation of Module::Build for more installation
options (by running `perldoc Module::Build`).

[ExtUtils::MakeMaker]: https://metacpan.org/release/ExtUtils-MakeMaker
[nmake can be obtained from the Microsoft FTP site.]: ftp://ftp.microsoft.com/Softlib/MSLFILES/nmake15.exe
[Module::Build]: https://metacpan.org/release/Module-Build


Options
-------

    ./chklinks [options] URL1 [URL2 [URL3 …]]
    ./chklinks [-h|-v]

* `-1`, `--onelevel`

  Check the links on this page and stops.

* `-r`, `--recursive`

  Recursively check through this website.  This is the default.

* `-b`, `--below`

  Only check the links below this directory.  This is the default.

* `-p`, `--parent`

  Trace back to the parent directories.

* `-l`, `--local`

  Only check the links on this same host.

* `-s`, `--span`

  Check the links to other hosts (without recursion).  This is the
  default.

* `-e`, `--exclude path`

  Exclude this path.  Check for their existence but not check the
  links on them, just like they are on a foreign site.  Multiple
  `--exclude` are OK.

* `-i`, `--include path`

  Include this path.  An opposite of `--exclude` that cancels its
  effect.  The latter specified has a higher priority.

* `-d`, `--debug`

  Display debug messages.  Multiple `--debug` to debug more.

* `-q`, `--quiet`

  Disable debug messages.  An opposite that cancels the effect of
  `--debug`.

* `-h`, `--help`

  Display the help message and exit.

* `-v`, `--version`

  Output version information and exit.

* `URL1`, `URL2`, `URL3`

  The URLs of the websites to check against.


Notes
-----

* `chklinks` does not obey `Crawl-delay:` in `robots.txt` yet.  This
  is a problem in [WWW::RobotRules], but not `chklinks` itself.

* If you encounter warnings like this:

      Parsing of undecoded UTF-8 will give garbage when decoding entities at /usr/share/perl5/LWP/Protocol.pm line 114.

  This is an issue of [LWP::Protocol] version ≤ 1.43 (in libwww-perl
  version ≤ 5.805) when working with HTML::Parser version ≥ 3.40 and
  Perl version ≥ 5.8.  This issue is solved in LWP::Protocol
  version ≥ 1.46 (in libwww-perl version ≥ 5.806).  You can upgrade
  your LWP::Protocol to the current version.  If you cannot upgrade
  it, see [CPAN RT Bug#20274] for an LWP::Protocol patch on this.

[WWW::RobotRules]: https://metacpan.org/pod/WWW::RobotRules
[LWP::Protocol]: https://metacpan.org/pod/LWP::Protocol
[CPAN RT Bug#20274]: https://rt.cpan.org/Public/Bug/Display.html?id=20274


Bugs
----

`chklinks` does not support authentication yet.  [W3C-LinkChecker]
supports this.  As a workaround, You can use the syntax
`http://user:pass@some.where.com/some/path` for Basic Authentication,
but this does not work on Digest Authentication.  This practice is
not encouraged.  Your password would be visible to anyone on this
system using `ps`, including hidden intruders.  Also, what you type
in your shell will be saved to your shell history file.

`mailto:` URLs should be supported by checking the validity of its
DNS/MX record.  Bastian Kleineidam's [linkchecker] have support on
this.

Local file checking has only been tested on Unix and MSWin32.  More
platforms should be tested, especially VMS and Mac.

[W3C-LinkChecker]: https://validator.w3.org/checklink
[linkchecker]: https://wummel.github.io/linkchecker


See Also
--------

[LWP::UserAgent], [LWP::RobotUA], [WWW::RobotRules], [URI],
[HTML::LinkExtor], Bastian Kleineidam’s [linkchecker] and
W3C-LinkChecker [checklink].

[LWP::UserAgent]: https://metacpan.org/pod/LWP::UserAgent
[LWP::RobotUA]: https://metacpan.org/pod/LWP::RobotUA
[WWW::RobotRules]: https://metacpan.org/pod/WWW::RobotRules
[URI]: https://metacpan.org/release/URI
[HTML::LinkExtor]: https://metacpan.org/pod/HTML::LinkExtor
[linkchecker]: https://wummel.github.io/linkchecker
[checklink]: https://validator.w3.org/checklink


Release Notes
-------------

Please read the `NEWS` for the new functions and bug fixes.


Support
-------

The `chklinks` project is hosted on GitHub.  Address your issues on the
GitHub issue tracker https://github.com/imacat/chklinks/issues.


License
-------

    Copyright (C) 2003-2021 imacat.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


imacat ^_*'  
2003/5/25  
<imacat@mail.imacat.idv.tw>  
https://www.imacat.idv.tw  
