Copy-Item "C:\vagrant\*.iso" -Destination "C:\tmp"
$iso = (get-item "c:\tmp\*.iso"|select -first 1).fullname
Mount-DiskImage -ImagePath $iso