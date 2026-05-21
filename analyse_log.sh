#!/bin/bash

echo -e "Отчет о логе веб-сервера\n=============================" > report.txt

count_log=0

while read -r line; do
        count_log=$((count_log + 1))
done < ./access.log

echo  "Общее количество запросов:$count_log" >> report.txt

awk '{print $1}' access.log | sort| uniq | awk '{count++} END {print "Количество ункальных IP-фдресов: ",count}' >> report.txt

awk '{print substr($6,2)}' access.log | sort | uniq -c | awk '{print "Количество запросов по методам: ", $1, $2}' >> report.txt

awk '{print $7}' access.log | sort | uniq -c | sort -r | head -1 | awk '{print "Самый популярный URL: ", $1, $2}' >> report.txt

echo  "Отчет сохранен в файл report.txt"