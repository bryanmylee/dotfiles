-- My current Airpods has ID f4-af-e7-20-3f-ca
set airpodsStatus to do shell script "/usr/local/bin/blueutil --is-connected f4-af-e7-20-3f-ca"

if airpodsStatus is "1"
    do shell script "/usr/local/bin/blueutil --disconnect f4-af-e7-20-3f-ca"
else
    do shell script "/usr/local/bin/blueutil --connect f4-af-e7-20-3f-ca"
end if
