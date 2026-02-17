# Windows KMS Activator Script

## ⚠️ IMPORTANT LEGAL NOTICE

This script is a **technical tool** for activating Windows using the Key Management Service (KMS) method. It is intended for **organizations with valid Volume Licensing agreements** who have purchased the appropriate licenses from Microsoft or authorized resellers.

### 🔑 Licensing Requirements

- **You must provide your own genuine product keys** obtained through legitimate Microsoft Volume Licensing programs (Open, Open Value, Select, Enterprise, or Services Provider License agreements).
- This script **does not generate, create, or bypass** license keys – it simply automates the activation process using keys you already own.
- The KMS client keys (GVLKs) listed in Microsoft's official documentation are **public Generic Volume License Keys** that come preinstalled with volume licensed editions of Windows.

---

## 📁 Repository Contents

| File | Description |
|------|-------------|
| `activate.ps1` | **Main PowerShell script** – automates Windows activation with dual KMS server fallback |
| `README.md` | This documentation file |

---

## 🚀 How to Use `activate.ps1`

### Prerequisites

- Windows 10/11 or Windows Server (2012 R2 or later)
- PowerShell running as **Administrator**
- A valid Windows product key (purchased through Volume Licensing)

### Step-by-Step Instructions

1. **Download the script**  
   Clone the repository or download `activate.ps1` directly:
 ```powershell
 git clone https://github.com/heanczko311299/windows-activator-script.git
 cd windows-activator-script
 ```

Run PowerShell as Administrator
Right-click on PowerShell and select "Run as Administrator"

Navigate to the script folder
```powershell
cd C:\path\to\downloaded\script
```

Execute the script
```powershell
.\activate.ps1
```

- Follow the prompts
- Enter your Windows product key when prompted
- The script will automatically:
- Install your product key
- Try to configure KMS server kms.digiboy.ir
- If that fails, fall back to kms.msguides.com
- Activate Windows

What the Script Does (Step by Step)


[1/4] Installing product key...    → slmgr /ipk [your-key]
[2/4] Trying primary server...     → slmgr /skms kms.digiboy.ir
[3/4] Trying secondary server...   → slmgr /skms kms.msguides.com (if primary fails)
[4/4] Activating Windows...        → slmgr /ato

Script Features

✅ Automatic ExecutionPolicy check – sets to RemoteSigned if needed

✅ Administrator privilege verification – warns if not running as admin

✅ Product key format validation – ensures correct format (XXXXX-XXXXX-XXXXX-XXXXX-XXXXX)

✅ Dual KMS server fallback – tries alternative if primary fails

✅ Clear visual feedback – color-coded progress messages

✅ License information display – shows current activation status at the end

🖥️ Supported Windows Versions

This script supports all volume-licensed editions of:
Version	Editions
✅ Windows 10	Pro, Enterprise, Education, Pro Workstations, LTSC
✅ Windows 11	Pro, Enterprise, Education, Pro Workstations, LTSC
✅ Windows Server	2012 R2, 2016, 2019, 2022, 2025
📋 Compatibility Notes

- KMS hosts are backward compatible – a newer KMS server can activate older Windows versions.
- Windows 11 requires a KMS host running Windows Server 2022 or later for optimal compatibility.
- Client computers must connect to the KMS host at least once every 180 days to stay activated.

⚙️ Technical Details
Script Logic Flow

# Simplified flow of activate.ps1
1. Check if running as Administrator
2. Check/Set ExecutionPolicy
3. Request product key from user
4. Validate key format
5. Install key (slmgr /ipk)
6. Try primary KMS server (kms.digiboy.ir)
7. If failed, try secondary (kms.msguides.com)
8. Activate (slmgr /ato)
9. Display current license info

Error Handling

The script includes error handling for:

- Invalid product key format
- Failed KMS server connections
- Activation errors
- Permission issues

🔧 Troubleshooting
"This script requires Administrator privileges"

Right-click PowerShell and select "Run as Administrator"

"ExecutionPolicy is Restricted"

The script will attempt to auto-fix this, or you can run manually:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

"Invalid product key form

- Ensure your key follows the format: XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
- Use only uppercase letters and numbers

Activation fails

- Check your internet connection
- Verify the KMS servers are reachable:

```powershell
Test-NetConnection kms.digiboy.ir -Port 1688
```


📚 Official References

- KMS Client Activation Keys (Microsoft Learn)
- KMS Activation Planning (Microsoft Learn)
- Volume Licensing Service Center

📄 License

This script is provided as-is for educational and legitimate business use. Always ensure compliance with Microsoft licensing terms.

Remember: This script is a convenience tool for legitimate license holders. Always ensure you have the proper licensing before activating any Microsoft product.
