#!/bin/bash

source ../config/pipeline_config.sh

exec > >(tee ../logs/alignment.log)
exec 2>&1

echo "====================================="
echo "ALINEAMIENTO CON MAFFT"
echo "====================================="

mkdir -p $ALIGN_DIR

INPUT_ALIGNMENT=$OTU_DIR/${OTU_PREFIX}_centroids.fasta

mafft --localpair \
      --maxiterate 1000 \
      --thread $THREADS \
      --op $MAFFT_OP \
      --ep $MAFFT_EP \
      $INPUT_ALIGNMENT \
      > $ALIGN_DIR/Thelephoraceae_OTUs_aligned.fasta

echo "Convirtiendo a PHYLIP"

seqmagick convert \
$ALIGN_DIR/Thelephoraceae_OTUs_aligned.fasta \
$ALIGN_DIR/Thelephoraceae_OTUs_aligned.phy

echo "Convirtiendo a NEXUS"

seqmagick convert \
$ALIGN_DIR/Thelephoraceae_OTUs_aligned.fasta \
$ALIGN_DIR/Thelephoraceae_OTUs_aligned.nexus

echo "Alineamiento completado"
