# make a SUMS file of the given file $f
f="traffic.pcap";out_f="$f.SUMS";for i in {md5,sha1,sha224,sha256,sha384,sha512}sum; do $i $f >> $out_f; done
