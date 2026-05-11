#!/bin/bash

source ../config/pipeline_config.sh

exec > >(tee ../logs/clustering.log)
exec 2>&1

echo "====================================="
echo "OTU CLUSTERING CON VSEARCH"
echo "====================================="

mkdir -p $OTU_DIR

if [ ! -f "$INPUT_FASTA" ]; then
    echo "ERROR: No se encontró el archivo FASTA"
    exit 1
fi

echo "Paso 1: Dereplicación"

vsearch --derep_fulllength $INPUT_FASTA \
  --output $OTU_DIR/${OTU_PREFIX}_derep.fasta \
  --sizeout \
  --minuniquesize 1

echo "Paso 2: Clustering OTU"

vsearch --cluster_fast $OTU_DIR/${OTU_PREFIX}_derep.fasta \
  --id $IDENTITY \
  --centroids $OTU_DIR/${OTU_PREFIX}_centroids.fasta \
  --uc $OTU_DIR/${OTU_PREFIX}_clusters.uc \
  --relabel OTU_

echo "Paso 3: Generando tabla OTU"

awk '$1 == "H" || $1 == "S" {
print $9 "\t" $10
}' $OTU_DIR/${OTU_PREFIX}_clusters.uc \
> $OTU_DIR/${OTU_PREFIX}_OTU_table.tsv

NUM_OTUS=$(grep -c ">" $OTU_DIR/${OTU_PREFIX}_centroids.fasta)

echo "Número total de OTUs: $NUM_OTUS"

echo "Clustering completado"
