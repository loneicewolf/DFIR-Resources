# Snippets & Commands


# ------------------------------------------------------------
## TSHARK
# note: you can use -q,-n
# note: Why do I include all the variables(pcap, ...) on each line? It's simply to make it easier to just copy paste and change.
## .. So you don't need to copy paste lines, change 1 or 2 lines, and then run it. Here you can just copy one line,
## .. and 'on-the-fly' (in a manner of speaking) modify what you need.

# Extract http,imf objs to DIR TSHARK_EXP_http/ , DIR TSHARK_EXP_imf/  Respectively
pcap="traffic.pcap" ; EXP_PROTO='http' ; tshark  -q  -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"
pcap="traffic.pcap" ; EXP_PROTO='imf' ; tshark  -q  -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"

# For loop that does these 2 things in one line
# note: here you of course could just use "$p" without the EXP_PROTO="$p" for a shorter code. I decided to keep the EXP_PROTO to make it a bit more readable
## and for some other things.
pcap="traffic.pcap" ; for p in {"http","imf"}; do EXP_PROTO="$p" ; tshark -q -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"; done

# Grab MAC Addresses
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z endpoints,eth

# Grab IPS
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z conv,ip

# Grab ExpertInfo
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z expert

# Others
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z http_srv,tree
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z http_req,tree

# ------------------------------------------------------------







