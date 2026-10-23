mmsg get keyboardlayout | jq ".layout" | sed "s/English (US)/us/;s/Russian/ru/"
