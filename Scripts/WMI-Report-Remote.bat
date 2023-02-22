@echo off
chcp 65001
cls

set /p hostname="Введите имя удаленного сервера: "

echo Дата отчета:
echo %date% %time%
echo ...
echo Имя компьютера и версия ОС:
wmic /node:"%hostname%" os get csname,caption > .\%hostname%_%date%.txt

echo Материнская плата:
wmic /node:"%hostname%" baseboard get Product >> .\%hostname%_%date%.txt

echo Процессор:
wmic /node:"%hostname%" CPU get name,NumberOfCores,NumberOfLogicalProcessors >> .\%hostname%_%date%.txt

echo Видео плата:
wmic /node:"%hostname%" path win32_VideoController get name >> .\%hostname%_%date%.txt

echo Оперативная память:
wmic /node:"%hostname%" MEMORYCHIP GET Devicelocator,Capacity >> .\%hostname%_%date%.txt

echo Физические диски:
wmic /node:"%hostname%" DISKDRIVE get model,size >> .\%hostname%_%date%.txt

echo Логичеие диски:
wmic /node:"%hostname%" LOGICALDISK get caption,Size,Freespace >> .\%hostname%_%date%.txt

echo Сетевые интерфейсы:
wmic /node:"%hostname%" nicconfig get Description,DHCPEnabled,IPAddress,macaddress >> .\%hostname%_%date%.txt

echo Установленные программы:
wmic /node:"%hostname%" product get name,version >> .\%hostname%_%date%.txt

echo Отчет создан: %hostname%_%date%.txt
timeout 5 & exit 0