package Class::Value::Contact::Name::Full;

# $Id: Full.pm 9762 2005-07-11 13:24:12Z gr $

use strict;
use warnings;


our $VERSION = '0.01';


use base 'Class::Value::Contact';


# A name is well-formed if it consists of 2-5 whitespace-separated words, at
# least two of which must contain at least two [A-Za-z] characters. This is
# rather arbitrary; if you allow different forms of names, subclass this
# class.
#
# Note that we don't check whether the string only consists of valid
# characters - that's handled by the charset handler mechanism in
# Class::Value::String (i.e., when checking for the validity of the value -
# here we check for well-formedness).

sub is_well_formed_value {
    my ($self, $value) = @_;
    return 1 unless defined($value) && length($value);
    return 0 unless $self->SUPER::is_well_formed_value($value);

    local $_ = $value;

    my @words = split /\s+/;
    return 0 if @words < 2 || @words > 5;

    my $valid_words = 0;
    for (@words) {
        $valid_words++ if 2 <= (() = /[A-Za-z]/g);
    }
    return $valid_words >= 2;
}


sub send_notify_value_not_wellformed {
    my ($self, $value) = @_;
    local $Error::Depth = $Error::Depth + 2;
    $self->exception_container->record(
        'Class::Value::Contact::Exception::Name::NotWellformed',
        name => $value,
    );
}


sub send_notify_value_invalid {
    my ($self, $value) = @_;
    local $Error::Depth = $Error::Depth + 2;
    $self->exception_container->record(
        'Class::Value::Contact::Exception::Name::Invalid',
        name => $value,
    );
}


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

