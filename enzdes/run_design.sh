#!/bin/bash
#$ -S /bin/bash
#$ -N design_book
#$ -cwd
#$ -e logs
#$ -o logs
#$ -l mem_free=4G
#$ -tc 50 


working_dir=$(pwd)
infile=`awk 'NR==n' n=$SGE_TASK_ID mymatches.list`
name=$(echo $infile|cut -d . -f1)

mkdir $name
cd $name

~/Rosetta/main/source/bin/rosetta_scripts.default.linuxgccrelease @$working_dir/enzflags_parser -overwrite -parser:protocol $working_dir/design_on.xml -s $working_dir/../matcher/$infile -nstruct 10 -database ~/Rosetta/main/database -score:weights ~/Rosetta/main/database/scoring/weights/talaris2013_cst.wts -extra_res_fa $working_dir/../matcher/LG1.params -enzdes::cstfile $working_dir/../matcher/LG1.enzdes.cst 
