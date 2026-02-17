# Windows KMS Activator Script v2.1 (English)
# With ExecutionPolicy check and dual KMS server fallback

# ============================================
# EXECUTION POLICY CHECK (Run as Admin)
# ============================================

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "WARNING: This script requires Administrator privileges." -ForegroundColor Yellow
    Write-Host "Please run PowerShell as Administrator and try again." -ForegroundColor Yellow
    Read-Host "`nPress ENTER to exit"
    exit
}

# Check if ExecutionPolicy allows script execution
$currentPolicy = Get-ExecutionPolicy
if ($currentPolicy -eq 'Restricted') {
    Write-Host "WARNING: Current ExecutionPolicy is 'Restricted'." -ForegroundColor Yellow
    Write-Host "Attempting to set to 'RemoteSigned' for current user..." -ForegroundColor Yellow
    try {
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force -ErrorAction Stop
        Write-Host "SUCCESS: ExecutionPolicy set to RemoteSigned." -ForegroundColor Green
    } catch {
        Write-Host "ERROR: Failed to set ExecutionPolicy. Please run this command manually:" -ForegroundColor Red
        Write-Host "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Cyan
        Read-Host "`nPress ENTER to exit"
        exit
    }
}

# ============================================
# FUNCTIONS
# ============================================

function Show-Banner {
    Clear-Host
    Write-Host @"
╔══════════════════════════════════════════════╗
║     WINDOWS KMS ACTIVATOR - DUAL SERVER      ║
║         (Compatible with Win 10/11/Server)   ║
╚══════════════════════════════════════════════╝
"@ -ForegroundColor Cyan
    Write-Host ""
}

function Test-ProductKeyFormat {
    param([string]$Key)
    # Basic format validation: XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
    return $Key -match '^[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}$'
}

function Set-KMS-Server {
    param([string]$Server)
    
    Write-Host "Configuring KMS server: $Server..." -NoNewline
    $result = cscript //nologo "$env:windir\system32\slmgr.vbs" /skms $Server 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host " OK" -ForegroundColor Green
        return $true
    } else {
        Write-Host " FAILED" -ForegroundColor Red
        return $false
    }
}

# ============================================
# MAIN PROGRAM
# ============================================

Show-Banner

# 1. Request product key
do {
    $productKey = Read-Host "Enter your Windows product key (XXXXX-XXXXX-XXXXX-XXXXX-XXXXX)"
    
    if (Test-ProductKeyFormat $productKey) {
        Write-Host "Valid key format" -ForegroundColor Green
        $validKey = $true
    } else {
        Write-Host "Invalid format. Please try again." -ForegroundColor Red
        $validKey = $false
    }
} while (-not $validKey)

Write-Host ""
Write-Host "───────────────────────────────────────────" -ForegroundColor Gray

# 2. Install product key
Write-Host "[1/4] Installing product key..." -ForegroundColor Yellow
$result = cscript //nologo "$env:windir\system32\slmgr.vbs" /ipk $productKey 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "Key installed successfully" -ForegroundColor Green
} else {
    Write-Host "Error installing key:" -ForegroundColor Red
    Write-Host "$result" -ForegroundColor Gray
    Read-Host "`nPress ENTER to exit"
    exit
}

Write-Host ""
Write-Host "───────────────────────────────────────────" -ForegroundColor Gray

# 3. Try first KMS server
Write-Host "[2/4] Trying primary server..." -ForegroundColor Yellow
$server1 = "kms.digiboy.ir"
$success = Set-KMS-Server $server1

if (-not $success) {
    Write-Host ""
    Write-Host "[3/4] Trying secondary server..." -ForegroundColor Yellow
    $server2 = "kms.msguides.com"
    $success = Set-KMS-Server $server2
    
    if (-not $success) {
        Write-Host "Could not configure any KMS server" -ForegroundColor Red
        Read-Host "`nPress ENTER to exit"
        exit
    }
}

Write-Host ""
Write-Host "───────────────────────────────────────────" -ForegroundColor Gray

# 4. Activate Windows
Write-Host "[4/4] Activating Windows..." -ForegroundColor Yellow
$result = cscript //nologo "$env:windir\system32\slmgr.vbs" /ato 2>&1

Write-Host ""
if ($LASTEXITCODE -eq 0) {
    Write-Host "═══════════════════════════════════════════" -ForegroundColor Green
    Write-Host "ACTIVATION COMPLETED SUCCESSFULLY" -ForegroundColor Green
    Write-Host "═══════════════════════════════════════════" -ForegroundColor Green
} else {
    Write-Host "═══════════════════════════════════════════" -ForegroundColor Yellow
    Write-Host "ACTIVATION MAY HAVE FAILED" -ForegroundColor Yellow
    Write-Host "═══════════════════════════════════════════" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Error details:" -ForegroundColor Gray
    Write-Host "$result" -ForegroundColor Gray
}

Write-Host ""
Write-Host "───────────────────────────────────────────" -ForegroundColor Gray
Write-Host "Current license information:" -ForegroundColor Cyan
cscript //nologo "$env:windir\system32\slmgr.vbs" /dli | Select-Object -First 3

Write-Host ""
Read-Host "Press ENTER to exit"
