package Class::Value::Contact::EmailAddress_TEST;

# $Id$

use strict;
use warnings;
use Test::More;


our $VERSION = '0.01';


use base 'Class::Value::Test';


use constant well_formed_values => (
    'gr@univie.ac.at',
    '123@456.789.zz',
    '*@q.to',
    'a+b@c.com',
    '0@0.0',
);


use constant not_well_formed_values => (
    '',
    'Borg',
    'a.test',
    'foo@bar.com@blah.com',
    '0@0',
    'foo@at',
);


1;


__END__

=head1 NAME

Class::Value::Contact - contact-related value objects

=head1 SYNOPSIS

None yet (see below).

=head1 DESCRIPTION

None yet. This is an early release; fully functional, but undocumented. The
next release will have more documentation.

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<classvaluecontact> tag.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-class-value-contact@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

Heinz Ekker C<< ek@univie.ac.at >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

