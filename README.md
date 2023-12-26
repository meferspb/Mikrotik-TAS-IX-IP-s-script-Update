# Mikrotik-TAS-IX-IP-s-script-Update
Address list update script for TAS-IX (internal IPv4 addresses for Uzbekistan)ю Updated for the latest version of RouterOS 7.13 at the time of writing.


IPv6 is not used in Uzbekistan. All addresses within Uzbekistan are version 4. The internal Internet works faster. To correctly limit the speed, you should limit the speed for connections outside TAS-IX or apply other Firewall rules for restrictions or to determine QoS priority. The script may work differently on different operators, on different versions of RouterOS. I provided an option for version 7-7.13. This is tested and works. It may be necessary to separate versions, but I have not yet encountered any problems other than blocking the resource for downloading until I added it to the TAS-IX list.
