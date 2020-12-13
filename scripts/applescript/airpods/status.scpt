-- My current Airpods has ID f4-af-e7-20-3f-ca
set airpodsStatus to do shell script "/usr/local/bin/blueutil --is-connected f4-af-e7-20-3f-ca"

if airpodsStatus is "1"
    return "On"
end if
return "Off"
