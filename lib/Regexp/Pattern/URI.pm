package Regexp::Pattern::URI;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

our %RE;

$RE{http} = {
    summary => 'Match an http/https URL',
    pat => qr{(?:(?:https?)://(?:(?:(?:(?:(?:(?:[a-zA-Z0-9][-a-zA-Z0-9]*)?[a-zA-Z0-9])[.])*(?:[a-zA-Z][-a-zA-Z0-9]*[a-zA-Z0-9]|[a-zA-Z])[.]?)|(?:[0-9]+[.][0-9]+[.][0-9]+[.][0-9]+)))(?::(?:(?:[0-9]*)))?(?:/(?:(?:(?:(?:(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*)(?:;(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*))*)(?:/(?:(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*)(?:;(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*))*))*))(?:[?](?:(?:(?:[;/?:@&=+$,a-zA-Z0-9\-_.!~*'()]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*)))?))?)}, # from Regexp::Common {URI}{HTTP} modified to support https
    examples => [
        {str=>'http://www.example.org/foo', matches=>1},
        {str=>'ftp://www.example.org/foo', matches=>0},
        {str=>'foo@example.org', matches=>0},
    ],
};

$RE{file} = {
    summary => 'Match a file:// URL',
    pat => qr{(?:(?:file)://(?:(?:(?:(?:(?:(?:(?:(?:[a-zA-Z0-9][-a-zA-Z0-9]*)?[a-zA-Z0-9])[.])*(?:[a-zA-Z][-a-zA-Z0-9]*[a-zA-Z0-9]|[a-zA-Z]))|(?:[0-9]+[.][0-9]+[.][0-9]+[.][0-9]+))|localhost)?)(?:/(?:(?:(?:(?:[-a-zA-Z0-9$_.+!*'(),:@&=]|(?:%[a-fA-F0-9][a-fA-F0-9]))*)(?:/(?:(?:[-a-zA-Z0-9$_.+!*'(),:@&=]|(?:%[a-fA-F0-9][a-fA-F0-9]))*))*)))))}, # from Regexp::Common {URI}{file}
    examples => [
        {str=>'file://foo/bar.txt', matches=>1},
        {str=>'ftp://www.example.org/foo', matches=>0},
        {str=>'foo/bar.txt', matches=>0},
    ],
};

$RE{ftp} = {
    summary => 'Match an ftp:// URL',
    pat => qr{(?:(?:ftps?|sftp)://(?:(?:(?:(?:[a-zA-Z0-9\-_.!~*'();:&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*))(?:)@)?(?:(?:(?:(?:(?:(?:[a-zA-Z0-9][-a-zA-Z0-9]*)?[a-zA-Z0-9])[.])*(?:[a-zA-Z][-a-zA-Z0-9]*[a-zA-Z0-9]|[a-zA-Z])[.]?)|(?:[0-9]+[.][0-9]+[.][0-9]+[.][0-9]+)))(?::(?:(?:[0-9]*)))?(?:/(?:(?:(?:(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*)(?:/(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*))*))(?:;type=(?:[AIai]))?))?)}, # from Regexp::Common {URI}{FTP}
    examples => [
        {str=>'ftp://www.example.org/foo', matches=>1},
        {str=>'http://www.example.org/foo', matches=>0},
        {str=>'foo/bar.txt', matches=>0},
    ],
};

$RE{ssh} = {
    summary => 'Match an ssh:// URL',
    pat => qr{(?:(?:ssh)://(?:(?:(?:(?:[a-zA-Z0-9\-_.!~*'();:&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*))(?:)@)?(?:(?:(?:(?:(?:(?:[a-zA-Z0-9][-a-zA-Z0-9]*)?[a-zA-Z0-9])[.])*(?:[a-zA-Z][-a-zA-Z0-9]*[a-zA-Z0-9]|[a-zA-Z])[.]?)|(?:[0-9]+[.][0-9]+[.][0-9]+[.][0-9]+)))(?::(?:(?:[0-9]*)))?(?:/(?:(?:(?:(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*)(?:/(?:(?:[a-zA-Z0-9\-_.!~*'():@&=+$,]+|(?:%[a-fA-F0-9][a-fA-F0-9]))*))*))(?:;type=(?:[AIai]))?))?)}, # from Regexp::Common {URI}{FTP} modified
    examples => [
        {str=>'ssh://user:pass@example.org:/foo/bar.git', matches=>1},
        {str=>'http://www.example.org/foo', matches=>0},
        {str=>'foo/bar.txt', matches=>0},
    ],
};

1;
# ABSTRACT: Regexp patterns related to URI

=head1 DESCRIPTION

This is currently a repackaging (lower startup-overhead version) of some of the
regexes in L<Regexp::Common::URI>.


=head1 SEE ALSO

L<Regexp::Pattern>

L<Regexp::Common>, particularly L<Regexp::Common::URI>
