package User;

use Moose;
with 'Does::ToHash';
use Digest::MD5 'md5_hex';

use namespace::autoclean;

has 'username' => ( is => 'ro', isa => 'Str', required => 1 );
has 'password' => ( is => 'ro', isa => 'Str', writer => '_set_password', required => 1 );

sub BUILD {
    my $self = shift;
    $self->_set_password(md5_hex($self->password));
}

sub password_eq {
    my ($self, $password) = @_;
    $password = md5_hex($password);

    return $password eq $self->password;
}

__PACKAGE__->meta->make_immutable;

1;
