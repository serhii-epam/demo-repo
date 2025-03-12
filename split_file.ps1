$upperBound = 200MB # calculated by Powershell
$ext = "dsv"
$rootName = "h_lineitem"

$reader = new-object System.IO.StreamReader("h_lineitem.dsv")
$count = 1
$fileName = "{0}{1}.{2}" -f ($rootName, $count, $ext)
while(($line = $reader.ReadLine()) -ne $null)
{
    Add-Content -path $fileName -value $line
    if((Get-ChildItem -path $fileName).Length -ge $upperBound)
    {
        ++$count
        $fileName = "{0}{1}.{2}" -f ($rootName, $count, $ext)
    }
}

$reader.Close()