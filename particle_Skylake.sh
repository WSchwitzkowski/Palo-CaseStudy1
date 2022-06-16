#!/bin/sh
#SBATCH --job-name=particle_skylake
#SBATCH --output=particle_skylake_results.txt
#SBATCH --partition=Intel_Skylake
#SBATCH --nodelist=fb05s-es-xeon01
#
#Limit execution to 5 minutes
#SBATCH --time=5:00

cd $SLURM_SUBMIT_DIR
echo "****************************"
echo " Job running on" $HOSTNAME 
echo "****************************"
likwid-setFrequencies -reset
echo "\n****************************"
echo " Runtime icc"
./01_Original_icc

#Optional GCC Test
#echo "\n****************************"
#echo " Runtime gcc"
#./01_Original_gcc
