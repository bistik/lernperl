use strict;
use warnings;

use Plack::Builder;
use Plack::Request;
use Template::Tiny;
use File::Slurp 'read_file';
use HTML::Entities 'encode_entities';

builder {

    mount '/' => sub {
        my $env = shift;
        my $request = Plack::Request->new($env);
        my @params;

        foreach my $param (sort $request->param) {
            my $values = join ',' => $request->param($param);
            push @params => { name => encode_entities($param), value => encode_entities($values) };
        }
        my $content = get_content(
            'templates/params.tt',
            {
                params => \@params,
                have_params => scalar @params,
            }
        );

        my $response = $request->new_response(200);
        $response->content_type('text/html');
        $response->content($content);

        return $response->finalize;
    };
};

sub get_content {
    my ( $file, $vars ) = @_;
    my $template_code = read_file($file);
    my $output;
    my $template = Template::Tiny->new;
    $template->process( \$template_code, $vars, \$output );

    return $output;
}
