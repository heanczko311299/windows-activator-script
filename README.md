# Windows KMS Activator Script

## ⚠️ IMPORTANT LEGAL NOTICE

This script is a **technical tool** for activating Windows using the Key Management Service (KMS) method. It is intended for **organizations with valid Volume Licensing agreements** who have purchased the appropriate licenses from Microsoft or authorized resellers.

### 🔑 Licensing Requirements

- **You must provide your own genuine product keys** obtained through legitimate Microsoft Volume Licensing programs (Open, Open Value, Select, Enterprise, or Services Provider License agreements) [citation:5].
- This script **does not generate, create, or bypass** license keys – it simply automates the activation process using keys you already own.
- The KMS client keys (GVLKs) listed in Microsoft's official documentation [citation:2][citation:7] are **public Generic Volume License Keys** that come preinstalled with volume licensed editions of Windows [citation:7].

### 💡 What This Script Does

1. Requests your **legally obtained** Windows product key
2. Installs the key using `slmgr /ipk`
3. Configures a KMS server (with fallback options)
4. Activates Windows using `slmgr /ato`

### 🖥️ Supported Windows Versions

This script supports **all volume-licensed editions** of:
- ✅ **Windows 10** (Pro, Enterprise, Education, Pro Workstations, LTSC) [citation:2][citation:7]
- ✅ **Windows 11** (Pro, Enterprise, Education, Pro Workstations, LTSC) [citation:2][citation:7]
- ✅ **Windows Server** (2012 R2, 2016, 2019, 2022, 2025) [citation:2][citation:5][citation:7]

### 📋 Compatibility Notes

- KMS hosts are **backward compatible** – a newer KMS server can activate older Windows versions [citation:1][citation:5][citation:9]
- Windows 11 requires a KMS host running **Windows Server 2022 or later** [citation:1]
- Client computers must connect to the KMS host at least once every **180 days** to stay activated [citation:5][citation:6]

### 📚 Official References

- [KMS Client Activation Keys (Microsoft Learn)](https://learn.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys) [citation:7]
- [KMS Activation Planning (Microsoft Learn)](https://learn.microsoft.com/en-us/windows-server/get-started/kms-activation-planning) [citation:5]
- [Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/default.aspx) [citation:5]

---

**Remember:** This script is a convenience tool for legitimate license holders. Always ensure you have the proper licensing before activating any Microsoft product.
