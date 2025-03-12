# New file to be created
$NewFile = 'h_lineitem'
# Assuming being in the same directory as the file. Otherwise this would be a file path
$OriginalFile = Get-Item h_lineitem.dsv
# Used to append to the file name
$increment = 1
$header = Get-Content h_lineitem.dsv -First 1
# Sends 1600000 lines into pipeline at a time
$add_header = 'N'
Get-Content $OriginalFile -ReadCount 1600000 | Foreach-Object {
  $NewFile = '{0}{1}{2}' -f $OriginalFile.BaseName,$increment++,$OriginalFile.Extension

  while (Test-Path ($NewFile)) {
    # Waiting for new file name that does not exist
  }
  $_ | Set-Content $NewFile
}