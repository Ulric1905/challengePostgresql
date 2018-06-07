
#!/usr/bin/env bash

echo 'script start'
psql --username=admin -c "ALTER system set TIMEZONE TO 'Europe/Paris';"
psql --username=admin -c "Select current_time"
