cd C:\xampp\mysql\bin
mysqldump.exe -e -uroot -p -hlocalhost mhl > "C:\backups/backup %DATE%_%time:~0,2%_%time:~3,2%.sql"