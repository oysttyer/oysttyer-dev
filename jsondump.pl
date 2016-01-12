# An extension for oysttyer (https://github.com/oysttyer/oysttyer) that currently just adds a full dump command

use Data::Dumper;

$addaction = sub {
	my $command = shift;
	my $json;

	if ($command =~ s#^/jsondump ## && length($command)){
		if ($command =~ /^[0-9]+$/ && (0+$command > 19)){
			$json = &jsondump($command);
			print $stdout Dumper($json);
		}
		else {
			print $stdout "Not a valid tweet ID\n";	
		}
		return 1;
	}
	return 0;
};

sub jsondump{
	my $code = shift;

	#Copied from get_tweet
	return &grabjson("${idurl}?id=${code}", 0, 0, 0, undef, 1);
}
