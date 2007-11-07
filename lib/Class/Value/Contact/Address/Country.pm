package Class::Value::Contact::Address::Country;

# $Id: Country.pm 12438 2007-01-24 14:21:56Z gr $

use strict;
use warnings;
use Error::Hierarchy::Util 'assert_defined';


our $VERSION = '0.01';


use base 'Class::Value::Contact::Address';


# Class method:
#
# Takes a potential country name which could be an alias and returns the
# normal country name for that country (e.g., 'Oesterreich' and 'Austria'
# both map to 'Austria') If the name is already the normal name, it isn't
# changed and returned. If the name given isn't a country name (or an
# alias), a false value is returned.

sub normalize_value {
    my ($self, $value) = @_;
    return unless $value;
    $self->get_short_country_name($value);
}


# get_normal_country_name() can be called as a class method with an argument,
# or as an object method without an argument (in which case it will act on the
# object's value).

sub get_normal_country_name {
    my ($self, $country) = @_;
    our %cache;

    $country = $self->value unless defined $country;

    $cache{normal_country_name}{$country} =
        $self->_get_normal_country_name($country)
        unless defined $cache{normal_country_name}{$country};

    $cache{normal_country_name}{$country};
}


sub _get_normal_country_name {
    my ($self, $country) = @_;
    $country;    # no normalizations defined
}


# get_short_country_name() can be called as a class method with an argument,
# or as an object method without an argument (in which case it will act on the
# object's value).

sub get_short_country_name {
    my ($self, $country) = @_;
    our %cache;

    $country = $self->value unless defined $country;

    $cache{short_country_name}{$country} =
        $self->_get_short_country_name($country)
            unless defined $cache{short_country_name}{$country};

    $cache{short_country_name}{$country};
}


sub _get_short_country_name {
    my ($self, $country) = @_;
    undef;    # no short country names defined
}


sub send_notify_value_normalized {
    my ($self, $value, $normalized) = @_;
    my $class = 'Class::Value::Contact::Exception::ReplaceAliasCountry';
    $self->exception_container->record(
        $class,
        original    => $value,
        replacement => $normalized,
    );
}


sub send_notify_value_invalid {
    my ($self, $value) = @_;
    local $Error::Depth = $Error::Depth + 2;
    $self->exception_container->record(
        'Class::Value::Contact::Exception::InvalidCountry',
        country => $value,
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

