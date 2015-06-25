# These files are used in an example of Rosetta Match

Here, RosettaMatch will find a set of locations in the crystal structure 2jie
that can accomodate the backbone atoms of the theozyme. This will potentially 
add hydrolytic function once all the matching and mutations have been made.

Please see the book chapter in Methods in Molecular Biology:
"Design and creation of novel Ligand Binding Proteins"

Chapter: Functionalizing Binding Pockets in Proteins
By Steve J. Bertolani,
   Dylan Alexander Carlin,
   Justin B. Siegel


## The files in this folder are as follows

2jie.pdb		|-original crystal structure

2jie.renumber.pdb	|-renumbered to start at 1

LG1.conf.pdb		|-Alternate conformations for the ligand

LG1.enzdes.cst		|-Functional constraints for this chemical activity

LG1.mol2		|-The original mol2 file of just the ligand, used to create LG1.params and LG1_0001.pdb

LG1.params		|-Rosetta residue format file to treat the ligand in the scorefunction

LG1_0001.pdb		|-Rosetta numbered and atom-type conversion

positions.pos		|-Residue indices for all residues with CA within 8A of the ligand in 2jie.renumber.pdb

runmatch		|-QSUB Sun Grid Engine submission file for cluster usage, also contains the RosettaMatch
			|	command line instructions

theozyme.pdb		|-Where the LG1.enzdes.cst file measurements come from... before the angles and dihedrals 
			|	were generalized

