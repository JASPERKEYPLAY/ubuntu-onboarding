# 🚀 Jasper Keyplay Ubuntu Onboarding Guide

## 1. Overview

Welcome to Jasper Keyplay’s standardized Ubuntu workstation onboarding!  
This guide will walk you through installing Ubuntu with our custom autoinstall YAML, configuring your device, and getting started with all the company tools—**no manual setup needed.**

---

## 2. What You’ll Need

- A USB drive (at least 8GB)
- Ubuntu LTS ISO (**22.04 or 24.04 preferred**)
- Access to the latest `user-data.yaml` and `jk-postinstall.sh` files (from the company GitHub repo)
- Internet connection for installation

---

## 3. Installation Steps

### 3.1 Prepare Installation Media

- Create a bootable USB stick using [balenaEtcher](https://www.balena.io/etcher/) or [Rufus](https://rufus.ie/).
- Place `user-data.yaml` in the appropriate location for autoinstall  
  (for Ubuntu 22.04+, this is typically in a directory called `autoinstall/` at the root of the USB,  
  or as part of a preseed if building a custom ISO).
- Ensure `jk-postinstall.sh` is copied to `/opt/jk-postinstall.sh` on the installation media, or available to the installer.

### 3.2 Start Installation

- Boot the target machine from your USB drive.
- Select **“Install Ubuntu (autoinstall)”** if available.

### 3.3 Enter Your Details When Prompted

You will be prompted for:

- **Username:**  
  _Type your preferred username (e.g., `arunkumar`)_
- **Hostname:**  
  _Type your device name in the format: `jk-ks-yourname` (e.g., `jk-ks-arunkumar`)_
- **Password:**  
  _Choose a strong password that you will remember_

### 3.4 Automated Setup

The system will automatically install:

- All core company applications and developer tools
- Company wallpaper, lock screen, and boot splash
- Custom branding (logo watermark on the desktop)
- All pre-configured browsers, code editors, utilities, and VS Code extensions

### 3.5 Post-installation Steps

- On first login, you’ll find your environment ready to use.
- **Verify:** Open VS Code, browsers, XAMPP, etc. to ensure all applications are present.
- If anything is missing or not working, contact IT support.

---

## 4. Troubleshooting

- **Installation doesn’t start:**  
  - Verify your USB is set as the first boot device in BIOS/UEFI.

- **Applications missing after setup:**  
  - Make sure `jk-postinstall.sh` was executed correctly. Re-run manually if needed.

- **Wallpaper or logo not set:**  
  - Try rebooting, or check for image download/network issues during setup.

---

## 5. Support

For help, contact:  
**IT Support:** [support@jasperkeyplay.com](mailto:support@jasperkeyplay.com)

---
