#!/bin/bash
project=${PWD##*/}
sed -i '' "s/KiBot-CICD-Template/$project/g" pcb/KiBot-CICD-Template.kicad_pcb pcb/KiBot-CICD-Template.kicad_prl pcb/KiBot-CICD-Template.kicad_pro pcb/KiBot-CICD-Template.kicad_sch
mv pcb/KiBot-CICD-Template.kicad_pcb pcb/$project.kicad_pcb
mv pcb/KiBot-CICD-Template.kicad_prl pcb/$project.kicad_prl
mv pcb/KiBot-CICD-Template.kicad_pro pcb/$project.kicad_pro
mv pcb/KiBot-CICD-Template.kicad_sch pcb/$project.kicad_sch
echo "Initialised KiCad project"