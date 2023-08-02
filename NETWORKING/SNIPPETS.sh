# Snippets & Commands
# TODO: 
## [] mkdirs
## [] clean up
## [] improve comments
## [] 
## [] 
## [] 
## [] 

# Extract http,imf objs to DIR TSHARK_EXP_http/ , DIR TSHARK_EXP_imf/  Respectively
pcap="traffic.pcap" ; EXP_PROTO='http' ; tshark  -q  -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"
pcap="traffic.pcap" ; EXP_PROTO='imf'  ; tshark  -q  -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"
# same but for loop. Note there can be many variations for this.
## pcap="traffic.pcap" ; for p in {"http","imf"}; do EXP_PROTO="$p" ; tshark -q -r $pcap --export-objects "$EXP_PROTO,TSHARK_EXP_""$EXP_PROTO"; done

# Grab MAC Addresses
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z endpoints,eth | grep -oE '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | sort --unique

# Grab IPS
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z conv,ip | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort --unique

# Misc.
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z expert

# http
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z http_srv,tree
pcap="traffic.pcap" ; tshark -q -n -r $pcap -z http_req,tree

# Grab protocols and protocol hierarchy
pcap="traffic.pcap" ; tshark -T fields -e frame.protocols -nr $pcap | sort --unique
pcap="traffic.pcap" ; tshark -q -r $pcap -z io,phs



