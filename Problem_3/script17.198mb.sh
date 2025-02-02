echo "🧪🧪🧪✅ Remaining tests use valid keys 🧪🧪🧪✅\n"
echo "****** 17.189 MB input File ******\n"
echo "thread count: 1️⃣"
./encrypt_parallel 100 input_text_17.198mb.txt output_text.txt time1.txt 1
echo "thread count: 2️⃣"
./encrypt_parallel 100 input_text_17.198mb.txt output_text.txt time2.txt 2
echo "thread count: 4️⃣"
./encrypt_parallel 100 input_text_17.198mb.txt output_text.txt time4.txt 4
echo "thread count: 8️⃣\n"
./encrypt_parallel 100 input_text_17.198mb.txt output_text.txt time8.txt 8