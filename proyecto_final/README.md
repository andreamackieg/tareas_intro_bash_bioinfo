# Pipeline para clustering de OTUs y preparación de análisis filogenéticos

## Introducción

Es importante mencionar que las secuencias ambientales obtenidas mediante metabarcoding requieren múltiples pasos de procesamiento antes de poder utilizarse en análisis filogenéticos (como asignación taxonómica en blast y generar árboles de ML). Este proyecto únicamente automatiza el clustering de secuencias (ya filtradas) en OTUs, el alineamiento múltiple y la selección del modelo evolutivo más adecuado para análisis filogenéticos posteriores.

El pipeline fue diseñado para trabajar con secuencias ambientales ITS de hongos ectomicorrícicos pertenecientes a la familia Thelephoraceae utilizando herramientas bioinformáticas ampliamente utilizadas en análisis moleculares.

---

# Objetivo

Automatizar el procesamiento de secuencias ambientales ITS mediante:

- clustering OTU al 98% usando VSEARCH;
- generación de secuencias representativas;
- alineamiento múltiple usando MAFFT;
- conversión de formatos FASTA, PHYLIP y NEXUS;
- selección automática del mejor modelo evolutivo usando IQ-TREE.

---

# Flujo general del análisis

```
FASTA ambiental
        ↓
Dereplicación de secuencias
        ↓
Clustering OTU al 98%
        ↓
Obtención de centroides OTU
        ↓
Alineamiento múltiple con MAFFT
        ↓
Conversión de formatos filogenéticos
        ↓
Selección del mejor modelo evolutivo
```

---

# Estructura del repositorio

```
proyecto_final/
├── README.md
├── scripts/
├── datos/
├── resultados/
├── metadatos/
├── programas_contenedores/
├── config/
└── logs/
```

## Descripción de carpetas

| Carpeta | Descripción |
|---|---|
| scripts/ | Scripts principales del pipeline |
| datos/ | Datos de entrada |
| resultados/ | Resultados generados |
| metadatos/ | Información auxiliar y metadata |
| programas_contenedores/ | Archivos para reproducibilidad |
| config/ | Configuración general del pipeline |
| logs/ | Archivos de seguimiento y ejecución |

---

# Requisitos de software

El proyecto fue probado utilizando:

- Bash 5.1
- VSEARCH 2.29.3
- MAFFT 7.525
- IQ-TREE 2.3.6
- Seqmagick 0.8.4
- Windows 10 Home Single Language
- Ubuntu 22.04 LTS mediante WSL

---

# Reproducibilidad

El ambiente puede instalarse mediante Conda utilizando el archivo `environment.yml`.

## Crear ambiente

```bash
conda env create -f programas_contenedores/environment.yml
```

## Activar ambiente

```bash
conda activate otu_pipeline
```

---

# Instrucciones de uso

## 1. Clonar el repositorio

```bash
git clone https://github.com/andreamackieg/tareas_intro_bash_bioinfo.git
```

---

## 2. Entrar al proyecto

```bash
cd tareas_intro_bash_bioinfo/proyecto_final
```

---

## 3. Dar permisos de ejecución

```bash
chmod +x scripts/*.sh
```

---

## 4. Colocar archivo FASTA

Colocar el archivo FASTA ambiental de entrada en:

```
datos/raw/sequences.fasta
```

---

## 5. Ejecutar el pipeline completo

```bash
cd scripts
./run_all.sh
```

---

# Entradas y salidas

## Entrada

Archivo FASTA ambiental:

```
datos/raw/sequences.fasta
```

---

## Salidas principales

### OTU clustering

Ubicación:

```
resultados/otu_clustering/
```

Archivos generados:

- Thelephoraceae_OTU_centroids.fasta
- Thelephoraceae_OTU_clusters.uc
- Thelephoraceae_OTU_table.tsv

---

### Alineamientos

Ubicación:

```
resultados/alignments/
```

Archivos generados:

- Thelephoraceae_OTUs_aligned.fasta
- Thelephoraceae_OTUs_aligned.phy
- Thelephoraceae_OTUs_aligned.nexus

---

### Selección de modelo evolutivo

Ubicación:

```
resultados/model_selection/
```

Archivos generados:

- Thelephoraceae_modeltest.iqtree
- Thelephoraceae_modeltest.log
- Thelephoraceae_modeltest.model.gz

---

# Explicación de scripts

## otu_vsearch_pipeline.sh

Realiza:

- dereplicación de secuencias;
- clustering OTU al 98%;
- generación de centroides;
- creación de tabla OTU.

---

## alignment_pipeline.sh

Realiza:

- alineamiento múltiple usando MAFFT;
- conversión a formatos PHYLIP y NEXUS.

---

## modeltest_pipeline.sh

Realiza:

- selección automática del mejor modelo evolutivo mediante IQ-TREE utilizando el criterio AIC.

---

## run_all.sh

Ejecuta automáticamente todos los pasos del pipeline.

---

# Información del sistema

Este proyecto fue probado en el siguiente equipo:

- Tipo de equipo: laptop
- Sistema operativo: Windows 10 Home Single Language (64 bits)
- Entorno de ejecución: Ubuntu 22.04 LTS mediante WSL
- CPU: Intel(R) Core(TM) i5-1035G1 CPU @ 1.00GHz
- Núcleos / hilos: 4 / 8
- RAM: 8 GB
- GPU: Intel(R) UHD Graphics
- Almacenamiento: SSD de 256 GB

Tiempo aproximado de ejecución: 5–15 minutos dependiendo del número de secuencias y del tamaño del alineamiento.

---

# Reproducibilidad adicional

El repositorio incluye:

- archivo `environment.yml` para recrear el ambiente Conda;
- archivo `Dockerfile` para generar un contenedor reproducible;
- logs de ejecución;
- archivo de configuración centralizado.

---

# Autoría

Andrea Mackie Greene

Proyecto desarrollado como trabajo final de bioinformática enfocado en análisis de secuencias ambientales de Thelephoraceae.

Repositorio del curso:

https://github.com/andreamackieg/tareas_intro_bash_bioinfo
