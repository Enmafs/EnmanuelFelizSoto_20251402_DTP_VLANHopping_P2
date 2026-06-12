# DTP VLAN Hopping Attack
**Estudiante:** Enmanuel Feliz Soto | **Matrícula:** 20251402
**Institución:** ITLA | **Curso:** Seguridad en Redes | **Práctica:** P2

## 📹 Video Demostración
🔗 [Ver en YouTube — DTP Attack](https://youtu.be/4JSALP-O0Sg)
🔗 [Playlist completa](https://www.youtube.com/playlist?list=PLn9wGcsdOtleB6unDjCUvq4LdJYgd4TTj)

## 🎯 Objetivo del Laboratorio
Demostrar un ataque DTP (Dynamic Trunking Protocol) que convierte una interfaz de acceso en una interfaz troncal, permitiendo VLAN Hopping para acceder a VLANs no autorizadas.

## 🎯 Objetivo del Script
Enviar mensajes DTP Negotiate desde un host atacante para que el switch negocie un enlace trunk con el atacante, dándole acceso a todas las VLANs del switch.

## ⚙️ Requisitos
```bash
sudo apt install yersinia -y
sudo bash EnmanuelFelizSoto_20251402_DTP_VLANHopping_P2.sh [interfaz]
```
- Yersinia 0.8.2+
- Root/sudo
- Puerto del switch en modo `dynamic auto` o `dynamic desirable`

## 📋 Parámetros
| Parámetro | Descripción | Default |
|-----------|-------------|---------|
| `$1` (interfaz) | Interfaz de red | `ens3` |
| `-attack 1` | Enviar DTP Negotiate | — |

## 🔧 Uso
```bash
# Ataque con interfaz por defecto
sudo bash EnmanuelFelizSoto_20251402_DTP_VLANHopping_P2.sh

# Ataque con interfaz específica
sudo bash EnmanuelFelizSoto_20251402_DTP_VLANHopping_P2.sh eth1
```

## 🗺️ Topología de Red
| Dispositivo | Rol | Estado Puerto |
|-------------|-----|---------------|
| SW1 | Switch objetivo | dynamic auto (vulnerable) |
| Ubuntu MATE | Host atacante (Yersinia) | ens3 → negocia trunk |

**Entorno:** PNetLab con Cisco IOL + Ubuntu MATE (Desktop)

## 🔍 Funcionamiento
1. El switch tiene el puerto en modo `dynamic auto` (vulnerable por defecto)
2. Yersinia envía DTP frames de negociación desde el atacante
3. El switch acepta la negociación y convierte el puerto en **trunk**
4. El atacante ahora tiene acceso a **todas las VLANs** del switch
5. Con doble etiquetado 802.1Q se puede hacer hop a VLANs adicionales

## 🛡️ Contramedida
```
! Desactivar DTP en todos los puertos de acceso
SW(config-if)# switchport mode access
SW(config-if)# switchport nonegotiate

! En puertos trunk legítimos, forzar el modo
SW(config-if)# switchport mode trunk
SW(config-if)# switchport nonegotiate

! Cambiar la VLAN nativa a una VLAN sin uso
SW(config-if)# switchport trunk native vlan 999
```

## 📁 Estructura
```
├── EnmanuelFelizSoto_20251402_DTP_VLANHopping_P2.sh
├── EnmanuelFelizSoto_20251402_Informe_P2.pdf
├── screenshots/
└── README.md
```

> ⚠️ Solo para uso en laboratorio controlado con contrato de ética firmado.
