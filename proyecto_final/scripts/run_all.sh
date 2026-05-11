#!/bin/bash

exec > >(tee ../logs/pipeline.log)
exec 2>&1

echo "====================================="
echo "INICIANDO PIPELINE COMPLETO"
echo "====================================="

bash otu_vsearch_pipeline.sh

bash alignment_pipeline.sh

bash modeltest_pipeline.sh

echo "====================================="
echo "PIPELINE FINALIZADO"
echo "====================================="
