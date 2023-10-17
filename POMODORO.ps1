xxxxx
#hello1
#hello
#hello
# Check if the Windows Input Simulator module is installed
if (-not (Get-Module -ListAvailable -Name 'InputSimulator')) {
    Install-Module -Name 'InputSimulator' -Force -Scope CurrentUser
}

# Import the InputSimulator module
Import-Module InputSimulator

# Function to perform a single random mouse click
function PerformRandomClick {
    $screenWidth = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
    $screenHeight = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height

    $randomX = Get-Random -Minimum 0 -Maximum $screenWidth
    $randomY = Get-Random -Minimum 0 -Maximum $screenHeight

    $simulator = New-Object WindowsInput.InputSimulator
    $simulator.Mouse.MoveMouseToPositionOnVirtualDesktop($randomX, $randomY)
    $simulator.Mouse.LeftButtonClick()
}

# Loop to perform random clicks every 4 minutes
while ($true) {
    PerformRandomClick
    Write-Host "Performed a random click."
    Start-Sleep -Seconds (4 * 60)  # Sleep for 4 minutes
}
