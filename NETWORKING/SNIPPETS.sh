# Snippets & Commands


# ------------------------------------------------------------
## TSHARK
# note: you can use -q,-n

# Extract http,imf objs to DIR TSHARK_EXP_http/ , DIR TSHARK_EXP_imf/  Respectively
pcap="traffic.pcap" ; EXP_PROTO='http' ; tshark  -q  -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"
pcap="traffic.pcap" ; EXP_PROTO='imf' ; tshark  -q  -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"

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







