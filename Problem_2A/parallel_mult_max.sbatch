#!/bin/bash
# Choose the queue that you want to use
#SBATCH --partition=oucspdn_cpu
#SBATCH --exclusive
#SBATCH --ntasks=8
#SBATCH --ntasks-per-node=8
#SBATCH --chdir=/home/oucspdn027/Project_2/Problem_2
#SBATCH --output=/home/oucspdn027/Project_2/Problem_2/partA/Problem2_%J_stdout.txt
#SBATCH --error=/home/oucspdn027/Project_2/Problem_2/partA/Problem2_%J_stderr.txt
# Adjust time according to your needs and queue limit 
#SBATCH --time=00:15:00
#SBATCH --job-name=Project2_Problem2
#SBATCH --mail-user=Samuel.W.Evans-2@ou.edu
#SBATCH --mail-type=ALL

#################################################

echo "** 1000x1000 - 1 thread **"
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 1
echo "** 1000x2000 - 1 thread **"
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 1
echo "** 2000x1000 - 1 thread **"
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 1
echo "** 2000x2000 - 1 thread **"
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 1

echo "** 1000x1000 - 2 threads **"
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 2
echo "** 1000x2000 - 2 threads **"
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 2
echo "** 2000x1000 - 2 threads **"
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 2
echo "** 2000x2000 - 2 threads **"
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 2

echo "** 1000x1000 - 4 threads **"
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 4
echo "** 1000x2000 - 4 threads **"
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 4
echo "** 2000x1000 - 4 threads **"
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 4
echo "** 2000x2000 - 4 threads **"
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 4

echo "** 1000x1000 - 8 threads **"
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 8
echo "** 1000x2000 - 8 threads **"
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 8
echo "** 2000x1000 - 8 threads **"
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 8
echo "** 2000x2000 - 8 threads **"
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 8

# ...