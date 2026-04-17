#!/bin/bash

# Check if the user provided an ELF file
if [ -z "$1" ]; then
    echo "Error: No ELF binary provided."
    echo "Usage: ./peStats.sh <path_to_binary.elf>"
    exit 1
fi

ELF_FILE="$1"
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Set up GVSoC environment directly (no sourceme.sh needed)
GVSOC_INSTALL="${PROJECT_DIR}/gvsoc/install"
export PATH="${GVSOC_INSTALL}/bin:${PROJECT_DIR}/gvsoc/gapy/bin:${PATH}"
export PYTHONPATH="${GVSOC_INSTALL}/python:${PYTHONPATH:-}"
export LD_LIBRARY_PATH="${GVSOC_INSTALL}/lib:${LD_LIBRARY_PATH:-}"

echo "Running GVSoC trace analysis for: $ELF_FILE..."

# Run GVSoC with instruction trace and pipe into AWK
gvsoc --target=pulp-open --binary="$ELF_FILE" --trace=insn run 2>&1 | awk -v binary_name="$ELF_FILE" '
/gvsoc: command not found/ {
    print "ERROR: GVSoC environment not loaded properly!"
    error_found = 1
    exit
}
# Trace line format: "<timestamp_ps>: <cycle>: [<path>] ..."
# FC:      /chip/soc/fc/insn
# Cluster: /chip/cluster/pe0/insn .. pe7/insn
{
    # Extract cycle count (field 2, strip trailing colon)
    cyc = $2 + 0
    if (cyc > max_cycle) max_cycle = cyc
}
/\/fc\/insn/ {
    fc_insn++
}
/\/pe[0-9]+\/insn/ {
    match($0, /pe[0-9]+/)
    pe_name = substr($0, RSTART, RLENGTH)
    pe_counts[pe_name]++
}
END {
    if (error_found) exit;

    print "========================================="
    print "       Hardware Performance Summary"
    print "========================================="
    print "Binary Executed       : " binary_name
    print "Total Cycles (Global) : " (max_cycle == "" ? 0 : max_cycle)
    print "FC Instructions       : " (fc_insn == "" ? 0 : fc_insn)
    print "-----------------------------------------"

    for (i = 0; i < 16; i++) {
        name = "pe" i
        if (pe_counts[name] > 0 || i == 0) {
            printf "%-21s : %d\n", toupper(name) " Instructions", (pe_counts[name] == "" ? 0 : pe_counts[name])
        }
    }
    print "========================================="
}'
