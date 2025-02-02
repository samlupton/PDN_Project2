/opt/homebrew/bin/gcc-14 -fopenmp parallel_mult_second_largest.c -o parallel_mult_second_largest
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 result_maximum1.csv time1.csv 8


echo "** 1000x1000 - 1 thread **"
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 1
echo "** 1000x2000 - 1 thread **"
./parallel_mult_second_largest mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 1
echo "** 2000x1000 - 1 thread **"
./parallel_mult_second_largest mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 1
echo "** 2000x2000 - 1 thread **"
./parallel_mult_second_largest mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 1

echo "** 1000x1000 - 2 threads **"
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 2
echo "** 1000x2000 - 2 threads **"
./parallel_mult_second_largest mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 2
echo "** 2000x1000 - 2 threads **"
./parallel_mult_second_largest mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 2
echo "** 2000x2000 - 2 threads **"
./parallel_mult_second_largest mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 2

echo "** 1000x1000 - 4 threads **"
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 4
echo "** 1000x2000 - 4 threads **"
./parallel_mult_second_largest mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 4
echo "** 2000x1000 - 4 threads **"
./parallel_mult_second_largest mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 4
echo "** 2000x2000 - 4 threads **"
./parallel_mult_second_largest mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 4

echo "** 1000x1000 - 8 threads **"
./parallel_mult_second_largest mat1000x1000.csv 1000 1000 mat1000x1000.csv 1000 1000 res1.csv time1.csv 8
echo "** 1000x2000 - 8 threads **"
./parallel_mult_second_largest mat1000x2000.csv 1000 2000 mat2000x1000.csv 2000 1000 res2.csv time2.csv 8
echo "** 2000x1000 - 8 threads **"
./parallel_mult_second_largest mat2000x1000.csv 2000 1000 mat1000x2000.csv 1000 2000 res3.csv time3.csv 8
echo "** 2000x2000 - 8 threads **"
./parallel_mult_second_largest mat2000x2000.csv 2000 2000 mat2000x2000.csv 2000 2000 res4.csv time4.csv 8

# ...