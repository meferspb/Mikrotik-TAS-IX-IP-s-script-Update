{
/tool fetch url=https://tasix.sarkor.uz/full dst-path=tasix.rsc;
/ip firewall address-list remove [/ip firewall address-list find list=TAS-IX];
#Add specific addresses or ranges of addresses to add to the address sheet
/ip firewall address-list add address=192.168.88.0/24 comment="custom" list="TAS-IX";
:log info "Download Complete";
:delay 1;
:local netlist;
:local content;
:local test;
:local lineEnd;
:local lastEnd;
:local line;
:local netlist "TAS-IX";
:local content [/file get [/file find name=tasix.rsc] contents] ;
:local contentLen [:len $content];
:local lineEnd 0;
:local line "";
:local lastEnd 0;

:while ($lineEnd < $contentLen) do={
	:set lineEnd [:find $content "\n" $lastEnd];
	:if ([:len $lineEnd] = 0) do={
		:set lineEnd $contentLen;
	}
	:set line [:pick $content $lastEnd $lineEnd];
	:set lastEnd ($lineEnd + 1);
	:if ([:len $line] > 7) do={
		:set test  [/ip firewall address-list find address=$line list=$netlist ] ;
		#Uncommited for logging
    #:log info $test;
                                :if ($test ="") do={
                                     /ip firewall address-list add list=$netlist address=$line;
                                     #Uncommited for logging
                                     #:log info "New network $line added to $netlist list";
                                }
	}
} 
}
