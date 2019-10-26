function Get-BatteryLevel {
    <#
    .LINK
    https://github.com/si-kotic/Get-BatteryLevel
    #>
    $Battery = Get-CimInstance -ClassName Win32_battery

    IF ($Battery.BatteryStatus -eq 1) {
        $ChargingStatus = ([char]9768)
    } ELSE {
        $ChargingStatus = ([char]9889)
    }
    Write-Host "$ChargingStatus" -NoNewline

    $BatteryLevel = $Battery.EstimatedChargeRemaining[0] / 10

    0..10 | ForEach-Object {
        if ($_ -le $BatteryLevel) {
            IF ($BatteryLevel -le 3) {
                write-host ([char]9619) -NoNewline -ForegroundColor "DarkRed"
            } ELSE {
                write-host ([char]9619) -NoNewline -ForegroundColor "DarkCyan"
            }
	}
	else {
	    write-host ([char]9617) -NoNewline
        }
    }
    $BatteryPercent = $BatteryLevel * 10
    Write-Host " ($BatteryPercent%) " -NoNewLine
}