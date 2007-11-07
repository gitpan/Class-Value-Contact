package Class::Value::Contact::PhoneLikeNumber;

# $Id: PhoneLikeNumber.pm 13653 2007-10-22 09:11:20Z gr $

use strict;
use warnings;


our $VERSION = '0.01';


use base 'Class::Value::Contact';


__PACKAGE__->mk_abstract_accessors(qw(
    NORMALIZE_EXCEPTION_NAME INVALID_VALUE_EXCEPTION_NAME
));


sub normalize_value {
    my ($self, $value) = @_;
    local $_ = $value;
    return unless s/^(00|\+)//;
    s/\D//g;
    $_ = "+$_";
    return if length() < 8 || length() > 21;
    return $_;
}


sub send_notify_value_invalid {
    my ($self, $value) = @_;
    my $class = $self->INVALID_VALUE_EXCEPTION_NAME;
    $self->exception_container->record(
        $class,
        phone  => $value,
    );
}


sub send_notify_value_normalized {
    my ($self, $value, $normalized) = @_;
    my $class = $self->NORMALIZE_EXCEPTION_NAME;
    $self->exception_container->record(
        $class,
        original    => $value,
        replacement => $normalized,
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

