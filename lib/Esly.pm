use v5.14;
package Esly {
    use Moose;
    use Method::Signatures;
    use ElasticSearch;

    has es => (
        is => "ro",
        isa => "ElasticSearch",
        lazy_build => 1
    );

    method _build_es {
        return ElasticSearch->new(
            transport => "httptiny"
        );
    }

    method search($ss) {
        return $self->es->search(
            index => "lyg0v",
            type  => "interp_body",
            query => {
                text => {
                    content => $ss
                }
            },
            highlight => {
                fields => { content => {} },
            }
        )
    }
}

1;
