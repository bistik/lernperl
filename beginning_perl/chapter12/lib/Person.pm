package Person;

use strict;
use warnings;

use Carp 'croak';
use Try::Tiny;
use DateTime;
use DateTime::Duration;

sub new {
    my ($class, $arg_for) = @_;
    my $self = bless {}, $class;

    $self->_initialize($arg_for);
    return $self;
}

sub _initialize {
    my ($self, $arg_for) = @_;
    my %arg_for = %$arg_for;

    my $name = delete $arg_for{name};
    my $birthdate = delete $arg_for{birthdate};

    unless (defined $name && $name =~ /\w/) {
        croak "Person needs a valid name";
    }
    try {
        $birthdate->isa('DateTime') or die;
    } catch {
        croak "Birthdate must be DateTime instance";
    };

    $self->{attributes}{name} = $name;
    $self->{attributes}{birthdate} = $birthdate;
}

sub age {
    my $self = shift;
    my $age = DateTime::Duration->new;
    $age = DateTime->now - $self->{attributes}{birthdate};

    return $age->years;
}

1;
