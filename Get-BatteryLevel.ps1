function Get-BatteryLevel {
    $BatteryLevel = (Get-CimInstance -ClassName Win32_battery).EstimatedChargeRemaining[0] / 10

    0..10 | ForEach-Object {
        if ($_ -le $BatteryLevel) {
            write-host "▓" -NoNewline -ForegroundColor "DarkCyan"
	}
	else {
	    write-host "░" -NoNewline
        }
    }
    $BatteryPercent = $BatteryLevel * 10
    Write-Host " ($BatteryPercent%)"
}