/opt/homebrew/bin/gcc-14 -fopenmp parallel_mult_max.c -o parallel_mult_max 
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 1
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 result_maximum2.csv time2.csv 1
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 result_maximum3.csv time3.csv 1
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 result_maximum4.csv time4.csv 1
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 2
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 result_maximum2.csv time2.csv 2
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 result_maximum3.csv time3.csv 2
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 result_maximum4.csv time4.csv 2
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 4
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 result_maximum2.csv time2.csv 4
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 result_maximum3.csv time3.csv 4
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 result_maximum4.csv time4.csv 4
./parallel_mult_max mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_max mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 result_maximum2.csv time2.csv 8
./parallel_mult_max mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 result_maximum3.csv time3.csv 8
./parallel_mult_max mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 result_maximum4.csv time4.csv 8