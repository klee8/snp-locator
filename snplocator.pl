# Kate Lee and Ben Braim 2014
# DESCRIPTOR of your script snplocator.pl (or whatever you want to call it)
# use: perl snplocator.pl <vcf.txt> <blastout.txt> <outfile.txt>
########################################################

#!usr/bin/perl
use strict;
use warnings;

# get filename and open them  ### ARGV ###
my $vcf = $ARGV[0];
my $blastfile = $ARGV[1]; 
my $outfile = $ARGV[2];
 
open(VCF, "<$vcf") || die "couldn't open $vcf: $!";
open(BLAST, "$blastfile") || die "couldn't open $blastfile: $!";


# create hashes
My %snplist;
My %blasthits;

#Read in your vcf file to %snplist hash with something like this:   ### REGEX ###
LINE : while (<VCF>){
# add in regex (note use parenthesis to capture each bit of the regex you want in the order of the variables on the left of the equals sign. TEST REGEXs CAREFULLY WITH PRINT STATEMENTS AND A TEST DATA SET and make sure your test set reflects all the variation you get in your larger file.)
	my($radtag, $snppos) = ($_ =~ m/(REGEX_FOR_RADTAG)\t(REGEX_FOR_SNPPOS)/); 
	@{$snplist{$radtag}} = $snppos    #hash of arrays
}

#Get info from blast and put into %blasthits hash
while(<BLAST>){
	my($radtag, $Lacer, $ID, $length, $Sstart, $Send, $Lstart, $Lend, $evalue) = ($_=~ m/REGEX/);
	unless exists($blasthit{$radtag}) {
		$blasthit{$radtag} = (a joined string of $Lacer ,$Sstart, $Send, $Lstart, $Lend); #join
		$blasthit{$radtag}{"length"} = $length;  #nested hashes
		$blasthit{$radtag}{"ID"} = $ID;
	}
	else{
	# if the radtag already has a hit, check that the length and ID are bigger and replace string or not accordingly using # if statement
	}
}

# loop through filtered blast info
my $Lorientation = "F";
my $newsnppos;

foreach my $radtag (sort keys %blasthit) {
	#split the hit and positional info into variables for use below #split
	#check orientation of the match
	if ($Lstart < $Lend){ $Lorientation = "R"; }
	if ($Sstart < $Send){$Sorientation = "R";}
	# loop through the snps for that radtag
	for my $snp (@{$snplist{$radtag}})
		if ( ($LAorientation eq "F") && ($Sorientation eq "F") ) {
			foreach (@{$snplist{$radtag}} {
			$newsnppos = CALCULATION  ; # work this out on a piece of paper with diagrams first , seriously!
			#PRINT OUT TO A FILE
		}
		if ( ($LAorientation eq "F") && ($Sorientation eq "R") ) {
			foreach (@{$snplist{$radtag}} {
			$newsnppos = CALCULATION  ; # work this out on a piece of paper with diagrams first , seriously!
			#PRINT OUT TO A FILE
		# etc for other orientation options
	}               
}

