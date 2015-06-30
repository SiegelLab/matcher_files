#! /usr/bin/perl
#By Justin Siegel, Baker Group 11/6/05
### This script identifies residues that are going to be redesigned by RosettaDesign from a pdb
#
#
#
#
#PDBFORMAT
#REMARK BACKBONE TEMPLATE A LEU  183 MATCH MOTIF B SER    45  1
#ATOM   1853  N   GLU A 123       0.936  -4.291  10.687  1.00  0.00
#RESFILE format
# A  104  104 PIKAA  RKHTSYCAGN

if(!$ARGV[0] or !$ARGV[1]){ die("Incorrect command line: <WT-PDB> <Des-PDB>");}



my @pdb1 = @pdb2 = undef;

my $counter=0;

open( PDB, $ARGV[0]) or die("Could not open file $ARGV[0]!");
foreach $temp (<PDB>){
  if($temp =~ /^ATOM/){
    if(substr($temp, 13, 2) =~ /N\s/){
      $counter++;
      $pdb1[$counter] = substr($temp, 17, 3).substr($temp, 23, 3);
      #print "$pdb1[$counter] ";
    }
  }elsif($temp =~ /^\@ATOM/){
    if(substr($temp, 14, 2) =~ /N\s/){
      $counter++;
      $pdb1[$counter] = substr($temp, 18, 3).substr($temp, 24, 3);
      #print "$pdb1[$counter] ";
    }
  }
}

#print "\n";

close (PDB);
$counter=0;
open( PDB, $ARGV[1]) or die("Could not open file $ARGV[0]!");
foreach $temp (<PDB>){
  if($temp =~ /^ATOM/){
    if(substr($temp, 13, 2) =~ /N\s/){
      $counter++;
      $pdb2[1][$counter] = substr($temp, 17, 3).substr($temp, 23, 3);
      #print "$pdb2[$counter] ";
    }
  }
}
close (PDB);
$mutation_counter=0;
$mutation = "select mutated, resi ";
$checker = "Filter: ";
print "PDB1\tPDB2\n";
for($x=1;$x<=$counter;$x++){
  if($pdb1[$x] !~ /$pdb2[1][$x]/){print "$pdb1[$x]\t$pdb2[1][$x]\n"; $mutation=$mutation.$x."+"; $checker=$checker.$pdb1[$x].$pdb2[1][$x].","; $mutation_counter++;}
}
print substr($mutation,0,-1),"\n";
print "$checker\n$ARGV[1]\n";
print "Total Mutations: $mutation_counter\n";
exit(0);
