#!/bin/bash

# ======================================
# CONFIGURACIÓN GENERAL DEL PIPELINE
# ======================================

# Archivo FASTA de entrada
INPUT_FASTA="../datos/raw/Dominica_limpio.fasta"

# Identidad OTU
IDENTITY=0.98

# Prefijo de outputs
OTU_PREFIX="Thelephoraceae_OTU"

# Threads
THREADS=8

# Parámetros MAFFT
MAFFT_OP=3.0
MAFFT_EP=0.123

# Directorios de salida
OTU_DIR="../resultados/otu_clustering"
ALIGN_DIR="../resultados/alignments"
MODEL_DIR="../resultados/model_selection"
