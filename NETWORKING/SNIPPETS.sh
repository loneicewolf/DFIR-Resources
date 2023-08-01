# Snippets & Commands

# Extract http objects to DIR TSHARK_EXP_http/
pcap="traffic.pcap" ; EXP_PROTO='http' ; tshark -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"
# Extract imf objects to DIR TSHARK_EXP_imf/
pcap="traffic.pcap" ; EXP_PROTO='imf' ; tshark -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"

# Grab MAC Addresses
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z endpoints,eth

# Grab IPS
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z conv,ip

# Grab ExpertInfo
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z expert

# Others
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z http_srv,tree
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z http_req,tree
