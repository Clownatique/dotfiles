#!/bin/bash

# Vérification des arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 chemin/image.jpg"
    exit 1
fi

CHEMIN_IMAGE=$1

# Couleurs
declare -A COULEURS
COULEURS["vert_fonce"]="308D6A"
COULEURS["vert_clair"]="7FEBC2"
COULEURS["rose_clair"]="EB7FE2"
COULEURS["rose_fonce"]="8E3086"

# Traitements sur image
for NOM_COUL in "${!COULEURS[@]}"; do
    CODE_COULEUR=${COULEURS[$NOM_COUL]}
    
    # Création d'une image colorisée
    convert "$CHEMIN_IMAGE" -fill "#$CODE_COULEUR" -colorize 50% "${NOM_COUL}_colorise.jpg"
    
    # Création d'une image floutée et colorisée
    convert "$CHEMIN_IMAGE" -fill "#$CODE_COULEUR" -colorize 50% -blur 0x8 "${NOM_COUL}_blur.jpg"
done

echo "Traitements d'images terminés."

