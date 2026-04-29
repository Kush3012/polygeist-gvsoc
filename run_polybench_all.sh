#!/bin/bash
RESULTS_FILE="polybench_results.txt"
echo "PolyBench-ACC Toolchain Compilation & Run Results" > $RESULTS_FILE
echo "===============================================" >> $RESULTS_FILE

docker exec test_runner bash -c '
for file in $(find /workspace/PolyBench-ACC/OpenMP -type f -name "*.c" | grep -v utilities); do
    echo "================================================="
    echo "Testing $file"
    echo "================================================="
    if cd /workspace && ./toolchain.sh "$file" pulp-open; then
        echo "SUCCESS: $file" >> /workspace/polybench_results.txt
    else
        echo "FAILED: $file" >> /workspace/polybench_results.txt
    fi
done
'
docker cp test_runner:/workspace/polybench_results.txt /Users/rahul/compiler/polygeist-gvsoc-1/polybench_results.txt
cat /Users/rahul/compiler/polygeist-gvsoc-1/polybench_results.txt
