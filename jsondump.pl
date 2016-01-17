# An extension for oysttyer (https://github.com/oysttyer/oysttyer) that currently just adds a full dump command

use Data::Dumper;

$addaction = sub {
	my $command = shift;
	my $json;
	my $tweet;

	if ($command =~ s#^/jsondump ## && length($command)){
		$tweet = &get_tweet($command);
		if (defined($tweet->{'id_str'})) {
			$json = &jsondump($tweet->{'id_str'});
			print $stdout Dumper($json);
			return 1;
		}
		else {
			print $stdout "Not a valid tweet\n";	
			return 0;
		}
	}
	return 0;
};

sub jsondump{
	my $code = shift;

	#Copied from get_tweet
	return &grabjson("${idurl}?id=${code}", 0, 0, 0, undef, 1);
}
