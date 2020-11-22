function CalculateCoords {
    param (
        [parameter(Mandatory=$true)] [hashtable] $InitCoords,
        [parameter(Mandatory=$true)] [System.Double] $InitAngle,
        [parameter(Mandatory=$true)] [System.Double] $DistanceToGo
    )
    [System.Double]$Latitude = $InitCoords['latitude']
    [System.Double]$Longtitude = $InitCoords['longtitude']
    [System.String[]]$StringCoords = "$Latitude $Longtitude $InitAngle $DistanceToGo" | .\engines\dir.exe | % {$_ -split [System.Text.Encoding]::ASCII.GetString(9)} 
    [hashtable] $ResultingCoords = @{'latitude'=($StringCoords[0] -as [double]); 'longtitude'=($StringCoords[1] -as [double])}
	return $ResultingCoords;
}