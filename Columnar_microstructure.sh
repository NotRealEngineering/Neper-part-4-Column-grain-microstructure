#Property of Not Real Engineering 
#Copyright 2021 Not Real Engineering - All Rights Reserved. You may not use, 
#           distribute and modify this code without the written permission 
#           from Not Real Engineering.

# COLUMNAR MICROSTRUCTURE USING NEPER

cd /mnt/c
cd NRE_examples

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 50 -morpho "columnar(x)" -format tess -o Columnar_polycrystal
neper -V Columnar_polycrystal.tess -datacellcol id -datacelltrs 0.5 -imagesize 1200:1200 -print Columnar_polycrystal_image

# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Columnar_polycrystal.tess -order 2 -meshqualexpr Odis -meshqualmin 1
neper -V Columnar_polycrystal.tess,Columnar_polycrystal.msh -dataelsetcol id -imagesize 1200:1200 -print Columnar_polycrystal_mesh_image
#---------------------------------------------------------------#


# BAMBOO MICROSTRUCTURE USING NEPER

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 20 -morpho "bamboo(x)" -format tess -o Bamboo_polycrystal
neper -V Bamboo_polycrystal.tess -datacellcol id -datacelltrs 0.5 -imagesize 1200:1200 -print Bamboo_polycrystal_image

# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Bamboo_polycrystal.tess -meshqualexpr Odis -meshqualmin 1
neper -V Bamboo_polycrystal.tess,Bamboo_polycrystal.msh -dataelsetcol id -imagesize 1200:1200 -print Bamboo_polycrystal_mesh_image
#---------------------------------------------------------------#