package CPAN::Mini::Phalanx100;

use warnings;
use strict;

use CPAN::Mini;
use Data::Dumper;
use base qw(CPAN::Mini);

our $VERSION = '0.01';

=head1 NAME

CPAN::Mini::Phalanx100 - create a minimal mirror of CPAN containing
the modules in the "Phalanx 100"

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Unless you need to do something unusual, you probably should be looking 
at C<minicpan-phalanx>.

    use CPAN::Mini::Phalanx100;

    CPAN::Mini::Phalanx100->update_mirror(%args);
    ...

=head1 METHODS

=head2 update_mirror %args

Begins the process of creating a local CPAN mirror, but only downloads   
modules in the Phalanx 100.  See the documentation in CPAN::Mini for 
more details on the arguments.

=head1 AUTHOR

Steve Peters, C<< <steve@fisharerojo.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-cpan-mini-phalanx100@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically
be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<CPAN::Mini>

L<CPAN::Dependencies>

L<Phalanx Project|http://qa.perl.org/phalanx/>

=head1 ACKNOWLEDGEMENTS

Thanks to...

Ricardo Signes - for writing  L<CPAN::Mini>, which does 99% of the work in this module

Randal Schwartz - for writing the origial article that inspired all the CPAN::Mini modules

Andy Lester - for heading up the Phalanx project

Sébastien Aperghis-Tramoni - for his work on L<CPAN::Dependencies>

...and to everyone else involved in creating the Phalanx 100 list.

=head1 COPYRIGHT & LICENSE

Copyright 2005 Steve Peters, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

our %dists = ();

sub update_mirror {
    my $self = shift;
    my @args = @_;

    while(<DATA>) {
        chomp;
        $dists{$_} = 1;        
    }

    CPAN::Mini->update_mirror(@args, 'module_filters', [\&_phalanx_filter]);
}

sub _phalanx_filter {
   my $module = shift;
   return 1 if ! $dists{$module};
   return 0;
}

1; # End of CPAN::Mini::Phalanx100

__DATA__
Test::Builder::Tester
Test::Exception
Test::Harness
Test::NoWarnings
Test::Pod
Test::Pod::Coverage
Test::Reporter
Test::Simple
Test::Warn
Pod::Coverage
Sub::Uplevel
Devel::Symdump
Pod::Simple
Pod::Escapes
Test::Tester
CPANPLUS
DBD::mysql
DBI
GD
HTML::Parser
LWP
MIME::Base64
Net::SSLeay
Net::LDAP
XML::Parser
Apache::ASP
Archive::Tar
Archive::Zip
CGI
Compress::Zlib
Date::Manip
DBD::Oracle
DBD::Pg
DB_File
Digest
Digest::SHA1
Digest::HMAC
Digest::MD5
HTML::Tagset
HTML::Template
Net::Cmd
Mail::Internet
MIME::Tools
Net::DNS
Cwd
Time::HiRes
URI
Apache::DBI
Apache::Session
Apache::Test
AppConfig
App::Info
Authen::PAM
Authen::SASL
BerkeleyDB
Bit::Vector
Carp::Clan
Chart::Base
Class::Accessor
Class::Data::Inheritable
Class::DBI
Class::Singleton
Class::Trigger
Class::WhiteHole
Compress::Zlib::Perl
Config::IniFiles
Convert::ASN1
Convert::TNEF
Convert::UUlib
CPAN
Crypt::CBC
Crypt::DES
Crypt::SSLeay
Data::Dumper
Date::Calc
DateTime
DBD::DB2
DBD::ODBC
DBD::SQLite
DBD::Sybase
Device::SerialPort
Digest::SHA
Encode
Event
Excel::Template
Expect
ExtUtils::MakeMaker
File::Scan
File::Tail
File::Temp
GDGraph
GDTextUtil
Getopt::Long
HTML::Mason
Ima::DBI
Image::Size
Inline
IO
IO::All
IO::Socket::SSL
IO::String
IO::stringy
IO::Zlib
IPC::Run
XML::Parser::PerlSAX
Mail::Audit
Mail::ClamAV
Mail::Sendmail
Math::Pari
MIME::Lite
mod_perl
Module::Build
MP3::Info
Net::Daemon
Net::FTP::Common
Net::Ping
Net::Server
Net::SNMP
Net::SSH::Perl
Net::Telnet
OLE::Storage_Lite
Params::Validate
Parse::RecDescent
Image::Magick
RPC::PlClient
Pod::Parser
POE
SNMP
SOAP::Lite
Spiffy
Spreadsheet::ParseExcel
Spreadsheet::WriteExcel
Spreadsheet::WriteExcelXML
Storable
Template
Term::ReadKey
Term::ReadLine::Perl
Text::Iconv
Date::Parse
Time::Timezone
Unicode::String
UNIVERSAL::moniker
Unix::Syslog
WWW::Mechanize
XML::DOM
XML::Generator
XML::LibXML::Common
XML::LibXML
XML::NamespaceSupport
XML::SAX
XML::Simple
XML::Writer
YAML
