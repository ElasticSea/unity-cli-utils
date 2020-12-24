# Wipes clean all locations where Unity application stores user data

if ($args.Count -ne 2) {
    throw "Invalid arguments. Run like this: `"powershell.exe -file clear_user_data.ps1 [CompanyName] [ProjectName]`""
}

$companyName = $args[0];
$projectName = $args[1];

$registryKeyDirectory = "HKCU:\Software\Unity\UnityEditor\$($companyName)\$($projectName)"
Write-Host("Removing registry key directory: $($registryKeyDirectory)")
Remove-Item -Path $registryKeyDirectory -Recurse -Force -ErrorAction SilentlyContinue

$persistentDirectory = "$($env:USERPROFILE)\AppData\LocalLow\$($companyName)\$($projectName)"
Write-Host("Removing user persistent data directory: $($persistentDirectory)")
Remove-Item -Path $persistentDirectory -Recurse -Force -ErrorAction SilentlyContinue