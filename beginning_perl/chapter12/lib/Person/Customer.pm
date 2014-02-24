package Person::Customer;

use strict;
use warnings;

use base 'Person';

use Carp 'croak';

sub _initialize {
    my ($self, $arg_for) = @_;

    $self->SUPER::_initialize($arg_for);
    if ($self->age < 18) {
        croak "Customer must be atleast 18 years old";
    }
}

1;
