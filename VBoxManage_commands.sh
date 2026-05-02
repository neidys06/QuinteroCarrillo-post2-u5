# ============================================
# Lab 5 Post-Contenido 2 — VirtualBox Commands
# Estudiante: Neidys Mariana Quintero Carrillo
# Curso: Arquitectura de Computadores
# Universidad: Francisco de Paula Santander
# 2026
# ============================================

# PASO 1 - Crear interfaz Host-Only
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" hostonlyif create

# PASO 3 - Cambiar a modo Host-Only
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" modifyvm "Lab5.Alpine" --nic1 hostonly --hostonlyadapter1 "VirtualBox Host-Only Ethernet Adapter"

# PASO 3 - Volver a modo NAT
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Lab5.Alpine" poweroff
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" modifyvm "Lab5.Alpine" --nic1 nat

# PASO 4 - Tomar snapshot base
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" snapshot "Lab5.Alpine" take "snap_base" --description "Alpine Linux 3.23 recien instalado, sin modificaciones"

# PASO 4 - Tomar snapshot con herramientas
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" snapshot "Lab5.Alpine" take "snap_con_herramientas" --description "Alpine con curl wget nano y htop instalados"

# PASO 4 - Listar snapshots
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" snapshot "Lab5.Alpine" list

# PASO 4 - Restaurar snapshot base
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Lab5.Alpine" poweroff
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" snapshot "Lab5.Alpine" restore "snap_base"
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "Lab5.Alpine" --type gui

# PASO 5 - Exportar VM en formato OVA
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Lab5.Alpine" poweroff
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" export "Lab5.Alpine" --output "Lab5-Alpine-export.ova" --manifest --options manifest

# PASO 5 - Verificar archivo exportado
dir Lab5-Alpine-export.ova