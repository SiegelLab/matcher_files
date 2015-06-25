# These files are used in an example of Rosetta Enzyme Design

Here, Rosetta Enzyme Design will take individual matches and redesign the  
amino acid identities in the vicinity of the ligand. 

Please see the book chapter in Methods in Molecular Biology:
"Design and creation of novel Ligand Binding Proteins"

Chapter: Functionalizing Binding Pockets in Proteins
By Steve J. Bertolani,
   Dylan Alexander Carlin,
   Justin B. Siegel


## The files in this folder are as follows
|File			| Details 				|
|-----------|:-------------------:|
|design_on.xml		|> RosettaScript XML file to run the Rosetta Enzyme Design protocol|
|2jie.renumber.pdb	|> Various additional flags|
|LG1.conf.pdb		|> a list of matches located up a directory in the matcher folder. This list can be created using the command **ls UM\* > mymatches.list** Execute this command in the matcher folder and move the file to the enzdes folder |
|run_design.sh	|> QSUB Sun Grid Engine script designed to run Rosetta Enzyme Design on all matches simultaneously in a cluster enironment. Use the command  **qsub -t 1-N run_design.sh** where N is the number of lines in mymatches.list|