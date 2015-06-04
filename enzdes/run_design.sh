#!/bin/bash
#$ -S /bin/bash
#$ -N design_book
#$ -cwd
#$ -e logs
#$ -o logs
#$ -l mem_free=4G
#$ -tc 50 
#$ -v ROSETTA_BIN
#$ -v ROSETTA_DB

working_dir=$(pwd)
infile=`awk 'NR==n' n=$SGE_TASK_ID /home/bertolan/work/bookmatcher/mymatches.list`
name=$(echo $infile|cut -d . -f1)

mkdir $name
cd $name

$ROSETTA_BIN/rosetta_scripts.default.linuxgccrelease @$working_dir/enzflags_parser -overwrite -parser:protocol $working_dir/design_on.xml -s /home/bertolan/work/bookmatcher/matcher/$infile -nstruct 10 -database $ROSETTA_DB -score:weights $ROSETTA_DB/scoring/weights/talaris2013_cst.wts