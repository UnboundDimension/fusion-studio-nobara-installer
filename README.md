# 🧪 Fusion Studio 20 on Nobara 42 (Unofficial Installer)

**Get Blackmagic Fusion Studio 20.0.1 running on Nobara 42 with KDE Plasma 6**  
This script-based workaround solves the `zlib-ng` compatibility issue that prevents Fusion’s official Linux installer from working on Fedora-based systems.

---

## ⚠️ What This Is

Blackmagic’s `.run` installer does **not** work on Nobara/Fedora out of the box. It fails due to:

- Missing `zlib` (Nobara uses `zlib-ng`)
- Incompatible or obsoleted dependencies
- Lack of a proper install script for modern Fedora-based systems

This repo provides a safe workaround using a local zlib shim and manual extraction.

> ✅ Fusion Studio 20.0.1 was tested working on **Nobara 42 + KDE Plasma 6** using this method.

---

## ❗ What You’ll Need

- Download the `.run` installer from [Blackmagic’s support page](https://www.blackmagicdesign.com/support/)
  > Example filename: `Blackmagic_Fusion_Studio_Linux_20.0.1_installer.run`

- Required packages:
  ```bash
  sudo dnf install git binwalk squashfs-tools
  
  
  ---

## ⚠️ Known Issues

- **FBX plugin warning**: Appears at launch. Likely safe to ignore unless working with FBX directly.
- **Window spans across multiple monitors**: Fusion launches slightly misaligned on multi-monitor KDE setups. Fix TBD.

Feel free to open a GitHub Issue if you find a workaround.
