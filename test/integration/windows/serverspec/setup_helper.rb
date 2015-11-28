powershell_commands = [
  'Get-Disk | ?{$_.OperationalStatus -eq \'Offline\'}| Initialize-Disk;',
  'Get-Disk |?{!$(Get-Partition -DiskId $_.number -ErrorAction SilentlyContinue)} | '\
    'New-Partition -UseMaximumSize -AssignDriveLetter -ErrorAction SilentlyContinue;',
  'Get-Volume | ?{!$_.Filesystem} | Format-Volume -FileSystem NTFS -confirm:$false;',
  # Write something to the disk
  #  (unless you do this, you will receive "[Error opening directory 'D:/'. No such file or directory [2/2].")
  '@(\"D:\",\"E:\",\"F:\") | %{Set-Content -Path \"$_\test.file\" -Value \"test\"}',
  # Remove any previous snapraid content files
  '@(\'D:\',\'E:\') | %{remove-item $_\*.content};'
]

# We must specify Powershell absolutely because otherwise we'll launch 32bit PowerShell!
powershell_path = '%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe'

puts 'Initialising, formatting, and mounting the disks'
powershell_commands.each do |command|
  puts command
  `#{powershell_path} -executionpolicy bypass -command "&{#{command}}">> %TEMP%\\powershell.log 2>&1`
end
