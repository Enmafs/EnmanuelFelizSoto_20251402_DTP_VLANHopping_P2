# DTP VLAN Hopping Attack
**Estudiante:** Enmanuel Feliz Soto | **Matrícula:** 20251402
**Institución:** ITLA | **Curso:** Seguridad en Redes | **Práctica:** P2

## 📹 Video Demostración
🔗 [▶ DTP VLAN Hopping Attack — Ver en YouTube](https://youtu.be/4JSALP-O0Sg)
🔗 [Playlist completa NetSec](https://www.youtube.com/playlist?list=PLn9wGcsdOtleB6unDjCUvq4LdJYgd4TTj)

## 🎯 Objetivo del Laboratorio
Demostrar un ataque DTP que convierte una interfaz de acceso en trunk, permitiendo VLAN Hopping para acceder a VLANs no autorizadas.

## 🎯 Objetivo del Script
Enviar mensajes DTP Negotiate para que el switch negocie un enlace trunk con el atacante, dándole acceso a todas las VLANs.

## 🗺️ Topología
<img width="1430" height="477" alt="Captura de pantalla 2026-06-12 014740" src="https://github.com/user-attachments/assets/64956e2c-3cba-4165-8dee-bf5bda5c9101" />

### Estado del SW — Antes del ataque
<img width="1363" height="1154" alt="ChatGPT Image 11 jun 2026, 22_36_47" src="https://github.com/user-attachments/assets/21f743af-d285-4360-9ba1-1c2d8b921504" />

### Estado del SW — Después del ataque
<img width="565" height="342" alt="Captura de pantalla 2026-06-11 224638" src="https://github.com/user-attachments/assets/956eac72-868e-4be7-bb1a-6947f7867a2a" />

| Dispositivo | Rol | Estado Puerto |
|-------------|-----|---------------|
| SW1 | Switch objetivo | dynamic auto (vulnerable) |
| Ubuntu MATE | Host atacante (Yersinia) | ens3 → negocia trunk |

**Entorno:** PNetLab — Cisco IOL + Ubuntu MATE | **Base IP:** Matrícula 20251402 → 14.2.0.0

## ⚙️ Requisitos
```bash
sudo apt install yersinia -y
sudo bash EnmanuelFelizSoto_20251402_DTP_VLANHopping_P2.sh
```
Puerto del switch en modo `dynamic auto` o `dynamic desirable`

## 📋 Parámetros
| Parámetro | Descripción | Default |
|-----------|-------------|---------|
| `$1` interfaz | Interfaz de red | `ens3` |
| `-attack 1` | DTP Negotiate | — |

## 🔧 Uso
```bash
sudo bash EnmanuelFelizSoto_20251402_DTP_VLANHopping_P2.sh
sudo bash EnmanuelFelizSoto_20251402_DTP_VLANHopping_P2.sh eth1
```

## 🔍 Funcionamiento
1. Puerto del switch en modo `dynamic auto` (vulnerable por defecto)
2. Yersinia envía DTP frames de negociación
3. El switch convierte el puerto en **trunk**
4. El atacante accede a **todas las VLANs**

## 🛡️ Contramedida
```
SW(config-if)# switchport mode access
SW(config-if)# switchport nonegotiate
SW(config-if)# switchport trunk native vlan 999
```

> ⚠️ Solo para uso en laboratorio controlado con contrato de ética firmado.
