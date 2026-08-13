#!/bin/bash

set -e

# configuration
n_replicas=20
outdir="ensembles"
mkdir -p "${outdir}"

echo "Converting DCD trajectories to PDB ensembles"

# process each replica
for i in $(seq 1 ${n_replicas}); do
    cd ${i}
    
    echo "Processing replica ${i}..."
    
    # concatenate trajectory files
    catdcd -o replica.dcd -otype dcd \
        -dcd cycle_1.dcd cycle_2.dcd cycle_3.dcd cycle_4.dcd cycle_5.dcd \
              cycle_6.dcd cycle_7.dcd cycle_8.dcd cycle_9.dcd cycle_10.dcd \
              cycle_11.dcd cycle_12.dcd cycle_13.dcd cycle_14.dcd cycle_15.dcd \
              cycle_16.dcd cycle_17.dcd cycle_18.dcd cycle_19.dcd cycle_20.dcd
    
    # convert trajectory to PDB ensemble
    vmd -dispdev text \
        -e ../files/dcd_to_pdb.tcl \
        -args cycle_0.pdb replica.dcd ../${outdir}/replica_ensemble_${i}.pdb
    
    # clean up temporary file
    rm replica.dcd
    
    cd ..
done


echo "Creating ensemble_total.pdb..."

# merge all replica ensembles into a single PDB
for i in $(seq 1 ${n_replicas}); do
    grep -v '^END' "${outdir}/replica_ensemble_${i}.pdb"
done > "${outdir}/ensemble_total.pdb"

echo "END" >> "${outdir}/ensemble_total.pdb"

echo "Concluído!"
