package Does::ToHash;

use Moose::Role;

sub to_hash {
    my $self = shift;
    my @attributes = map { $_->name }
        $self->meta->get_all_attributes;
    my %hash;
    foreach my $attr (@attributes) {
        my $value = $self->$attr;
        next if ref $value;
        $hash{$attr} = $value;
    }
    return \%hash;
}

1;


