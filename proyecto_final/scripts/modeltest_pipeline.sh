#!/bin/bash

source ../config/pipeline_config.sh

exec > >(tee ../logs/modeltest.log)
exec 2>&1

echo "====================================="
echo "SELECCIÓN DE MODELO EVOLUTIVO"
echo "====================================="

mkdir -p $MODEL_DIR

iqtree \
  -s $ALIGN_DIR/Thelephoraceae_OTUs_aligned.phy \
  -m TEST \
  -nt AUTO \
  -pre $MODEL_DIR/Thelephoraceae_modeltest

echo "Model selection completado"
