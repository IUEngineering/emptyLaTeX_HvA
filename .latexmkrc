#Source: https://www.ctan.org/tex-archive/support/latexmk/example_rcfiles

# Works but compiles every time:
#
#    add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
#    add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
#    $clean_ext .= " acr acn alg glo gls glg";

#    sub makeglossaries {
#         my ($base_name, $path) = fileparse( $_[0] );
#         my @args = ( "-q", "-d", $path, $base_name );
#         if ($silent) { unshift @args, "-q"; }
#         return system "makeglossaries", "-d", $path, $base_name; 
#     }

# Might have bugs but is faster.
#
add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
$clean_ext .= " acr acn alg glo gls glg";

sub makeglossaries {
    my @args = ( "-s", "$_[0].ist", "-t", "$$Psource.ilg",
                "-o", $$Pdest, $$Psource );
    if ($silent) { unshift @args, "-q"; }
    return system "makeindex", @args;
}
