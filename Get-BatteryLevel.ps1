function Get-BatteryLevel {
    <#
    .LINK
    https://github.com/si-kotic/Get-BatteryLevel
    #>
    $BatteryLevel = (Get-CimInstance -ClassName Win32_battery).EstimatedChargeRemaining[0] / 10

    0..10 | ForEach-Object {
        if ($_ -le $BatteryLevel) {
            write-host ([char]9619) -NoNewline -ForegroundColor "DarkCyan"
	}
	else {
	    write-host ([char]9617) -NoNewline
        }
    }
    $BatteryPercent = $BatteryLevel * 10
    Write-Host " ($BatteryPercent%)"
}