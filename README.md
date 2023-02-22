# Batch Commands

### Set
`set` отобразить переменные окружения (%COMPUTERNAME%, %USERPROFILE%, %USERNAME%, %USERDOMAIN%) \
`set n` отобразить все текущие переменные, начинающиеся на букву n \
`hostname` имя компьютера \
`whoami` имя текущего залогиненого пользователя \
`set s1=server-01` \
`set /A sum=100+25` числовое выражение с возможностью использования арифметических операторов (+ - * / %) \
`set /P s2="Enter var: "` ручной ввод \
`echo %s1% and %s2%` вывести значение переменной на экран \
`echo off` отключает отображение эхо-команд \
`@` отключает отображение эхо-команд для отдельной строки \
`chcp` изменить кодировку (Using UTF-8 Encoding: 65001) \
`setlocal ... endlocal` переменная, заданная в блоке setlocal не является глобальной и используется до завершения командой endlocal

### If
`if %s1% equ %s2% (echo условие совпадает) else (echo Условие не совпадает)` \
`equ` равно \
`neq` не равно \
`gtr` больше \
`geq` больше или равно \
`lss` меньше \
`lcq` меньше или равно

### Operators
`|` конвеир \
`>` записать/перезаписать в файл \
`>>` добавить в файл \
`Command1 & Command2` сначала выполнятся Command1, потом Command2 \
`Command1 && Command2` Command2 будет выполняться только в том случае, если произошло успешное выполнение Command1 \
`Command1 || Command2` Command2 будет выполняться только в том случае, если Command1 не смогла выполниться \
`(Command1 & Command2) && Command3` группирование Command1 и Command2 (заключается в скобки), если данная группа команд выполнится успешно, произойдет выполнение Command3

### GOTO
`if "1"="1" goto start` если условие совпадает, перейти к заданной метке GOTO, пропуская чтение кода в промежутке \
`:start` выполнить переход к указанной метке

### For
`for %%переменная in (источник) do (оператор)` %%переменная существует только в теле цикла, в качестве имени возможно использовать только латинские буквы в диапазоне от а до z или от А до Z \
`/L` использует перебор значения переменной (начало,шаг,конец) для исполнения в блоке do \
`/F` читает текстовый файл построчно или результат вывода команды заданный в источнике для использования этих данных оператором \
`FOR /F "usebackq" %%a IN (``hostname``) DO (set hostname=%%a)` \
`"eol=:"` комментарий end-of-line, весь текст, который будет находиться после указанного символа будет приниматься за комментарий \
`"skip=5"` позволяет в цикле for задать количество строк, которые нужно пропустить, счет идет с начала файла \
`"delims=.:"` параметр позволяет переназначить стандартные разделители строк на подстроки. Стандартными разделителями является пробел и символ табуляции \
`"tokens=3,4"` указать номер подстроки, который нужно передать для обработки цикла в блок do

### File
`copy` копирование файлов и каталогов \
`/y` отменить вывод запроса подтверждения перезаписи \
`/v` проверка правильности копирования путем сравнения файлов \
`del` удаление только файлов \
`rd` удалить каталогов и файлов \
`/p` запрашивает подтверждение перед удалением каждого файла \
`/f` принудительное удаление файлов, доступных только для чтения \
`/q` отключение запроса подтверждения при удалении \
`/s` удалить указанный файл из всех подкаталогов или удаляет все каталоги и файлы в указанном каталоге

### arp
`arp -a` отобразить таблицу arp (динамические и статические записи). Динамическая запись добавляется при первом ping хоста \
`arp -a 192.168.1.1` \
`arp -d` очистить таблицу \
`arp -d 192.168.1.1` удалить запись \
`arp -s 192.168.1.1 00-aa-00-62-c6-09` добавить статическую запись

### getmac
`getmac /v` отобразить mac-адреса всех имеющихся физически и виртуальных интерфейсов \
`getmac /s server-01` удаленно

### ping
`ping -t -v 4 ya.ru` с зацикливением, только IPv4 \
`-a` resolve addresses to hostnames \
`-S` srcaddr - source address to use \
`-f -l 1472` не использовать фрагментацию пакета, используется для определения MTU (Maximum Transmission Unit) \
`-l 30000` указать размер пакета в байтах для проверки ширины канала \
`-n` указать кол-во пакетов \
`-w 50` изменить timeout в миллисекундах для ожидания каждого ответа (time - время от момента отправки до получения ответа в мс) \
`-i 2` пинговать второй узел в маршруте до конечного узла (TTL - от 1 до 255) \
`TTL (Time To Live)` время жизни пакета, на каждом промежуточном узле это число уменьшается на единицу

### tracert
`tracert -d` трассировка маршрута прохождения пакетов с помощью ICMP Echo-Request (-d без преобразования имени)

### route
`route print -4` вывести таблицу маршрутизации \
`route -p add 0.0.0.0 mask 0.0.0.0 192.168.1.1` добавить статический (-p постоянный) маршрут до подсети 0.0.0.0/0 через шлюз 192.168.1.1 \
`metric` задает стоимость маршрута в пределах от 1 до 9999, выбирается маршрут с наименьшей метрикой \
`route delete 10.*` удалить все статические маршруты из таблицы, которые начинаются с 10 \
`route -f` очистить таблицу маршрутизации

### ipconfig
`ipconfig /all` отобразить подробную информацию о настройках всех сетевых адаптеров, присутствующих в системе \
`ipconfig /renew` обновить сетевые настройки интерфейса, полученные от DHCP-сервера (DHCPREQUEST - сообщение используется для получения и продления аренды) \
`ipconfig /release` отправка сообщения DHCPRELEASE серверу DHCP для освобождения аренды IP-адреса. При получении этого сообщения сервер помечает адрес как свободный \
`ipconfig /displaydns` вывести на экран содержимое кэш службы разрешения имен DNS и их текущий TTL - время актуальности кэшированной записи в секундах \
`ipconfig /flushdns` сброс и очистка содержимого кэша сопоставления имен DNS клиента \
`ipconfig /registerdns` динамическая регистрация имени хоста на DNS сервере

### nslookup
`nslookup 192.168.1.1` узнать A-запись по IP и NS-сервер, который обрабатывает ответ \
`nslookup -type=ns yandex.ru` узнать NS-сервера обслуживающие зону \
`nslookup -type=mx yandex.ru` узнать адрес почтового сервера в домене

### Netstat
`netstat -a` вывод список всех активных подключений TCP и прослушиваемых (LISTENING) компьютером портов TCP и UDP \
`netstat -af` отображает FQDN с информацией о подключении \
`netstat -n` отображение адресов и номеров портов в числовом формате \
`netstat -b` отображение исполняемого файла, участвующего в создании каждого подключения или порта прослушивания \
`netstat -abo` отображает exe и идентификатор процесса (PID), связанный с соединением \
`netstat -sp icmp` сколько получено/отправлено пакетов \
`netstat -sp ip` сколько получено/отброшено пакетов (например отброшено firewall) \
`netstat -e` отображает статистику Ethernet, для проверки наличия ошибок и потери пакетов \
`LISTENING` ожидается соединение (слушается порт) \
`ESTABLISHED` соединение установлено \
`CLOSE_WAIT` ожидание закрытия соединения \
`CLOSED` соединение закрыто \
`TIME_WAIT` превышение времени ответа

### Netsh (Network Shell)
`netsh wlan show profile` список сохраненны профилей Wi-Fi \
`netsh wlan show interfaces` хар-ки текущей сети (MAC, speed) \
`netsh wlan show profile SSID-Name-Network key=clear` очистить пароль \
`netsh wlan show networks` список видемых сетей \
`netsh wlan disconnect` отключиться от Wi-Fi \
`netsh wlan connect name="SSID-Name-Network"` подключиться \
`netsh wlan show drivers` драйвер Wi-Fi

`netsh advfirewall set allprofiles state off` отключить fw \
`netsh advfirewall reset` сбросить настройки \
`netsh advfirewall firewall add rule name="Open Remote Desktop" protocol=TCP dir=in localport=3389 action=allow` открыть порт 3389 \
`netsh advfirewall firewall add rule name="All ICMP V4" dir=in action=allow protocol=icmpv4` открыть icmp

### GPO
`gpupdate /froce` применить политики на текущей машине \
`gpresult /R /S server-01.domain.local` отчет с удалённого компьютера \
`GPRESULT /S server-01 /H C:\GPReport.html` html-отчет

### Telnet
`telnet server-01 3389` проверка порта \
`dism /online /Enable-Feature /FeatureName:TelnetClient` включить Telnet Client

### TFTP-Client
`Dism /online /Disable-Feature /FeatureName:TFTP` \
`Enable-WindowsOptionalFeature –FeatureName "TFTP" -Online` powershell \
`tftp`

### PSTools
`PsPing server-01:3388` проверить порт \
`PsExec \\server-01 cmd` подключиться к cmd удаленного компьютера \
`PsExec @ComputersList.txt -u domain.local\username -p password msiexec -i "\\ukh-fs-01\msi\ManageEngineAssetExplorerAgent.msi"` \
`psinfo \\server-01` информация о системе (uptime и wmi) \
`PsLoggedOn \\server-01` кто залогинен на сервере \
`psloglist \\server-01` список логов \
`PsPasswd domain.local\username new_password` сменить пароль \
`PsGetSid domain.local\username` узнать SID пользователя \
`PsGetSid S-1-5-21-77917912-3486488180-2591182586-26128` узнать имя по SID \
`PsList \\server-01` список активных процессов \
`PsKill \\server-01 6248` завершить процесс по номеру Pid \
`PsService \\server-01 query hasp` найти службу по имени \
`PsService \\server-01 restart hasplms` перезапустить службу

### Assoc
`assoc .pdf=pdffile` создать ассоциацию файлов \
`ftype pdffile="%programfiles(x86)%\"Adobe\Acrobat DC\Acrobat\Acrobat.exe" "%1"` указать программу, для открытия файлов \
`SetUserFTA get` список текущих ассоциаций \
`SetUserFTA .txt Applications\notepad++.exe` \
`SetUserFTA .rar WinRAR` \
`SetUserFTA .html ChromeHTML` \
`SetUserFTA http ChromeHTML` \
`SetUserFTA https ChromeHTML`

### ACL (Access Control Lists)
`cacls \\server-01\Install\Document.docx` \
`/G имя:доступ` добавить разрешения для указанного пользователя \
`R` чтение \
`W` запись \
`C` чтение и запись \
`F` полный доступ \
`/P имя:доступ` изменить разрешения для указанного пользователя \
`N` нет доступа

### Users:
`netplwiz` учетные записи пользователей \
`net user "Adminstrator" password /add` создать локального пользователя \
`net localgroup Администраторы "Adminstrator" /add` добавить в группу локальных Администраторов \
`net localgroup Administrators "Adminstrator" /add`

### Net:
`net share` список расшаренных директорий (C$ - стандартный общий ресурс) \
`net file` список пользователей использующих шару и путь в данный момент времени \
`net file 883 /close` закрыть \
`net session` список активных пользователей и время активного сеанса \
`net session \\192.168.1.1 /delete` завершение сеанса с компьютероми и закрытие всех открытых файлов данного сеанса \
`net use X: /delete /Y` удалить сетевой диск (mount) \
`net use X: \\s0\DATA /USER:domain.local\username` примонтировать \
`net start PSEXESVC` запустить службу \
`net stop PSEXESVC` остановить службу

### SC
`sc query state=all` отобразить все службы (RUNNING и STOPPED) \
`sc start PSEXESVC` запустить службу \
`sc stop PSEXESVC` остановить службу \
`sc create RDP-Connections binPath=C:\Users\%username%\Documents\Service-RDP-Connections.exe DisplayName="RDP Connections" type=own start=auto` создать службу \
`sc config RDP-Connections DisplayName="TCP:3389 подключения"` изменить \
`sc delete RDP-Connections` удалить

### Tasklist
`tasklist /v` список процессов \
`taskkill /pid 1 /f` завершить процесс

### WMIC
`wmic qfe list brief` вывести полный список установленных обновлений \
`wusa /uninstall /kb:5009543` удалить обновление \
`wmic /node:"server-01" process list brief` вывести список всех активных процессов \
`wmic /node:"server-01" process get name` отсортировать по столбцу Name \
`wmic /node:"server-01" process get name | find "MobaXterm"` поиск с соблюдением регистра \
`wmic /node:"server-01" process where name="MobaXterm.exe" delete` завершить процесс

### CHKDSK
`CHKDSK C: /F /R` Проверки жёсткого диска на наличие логических ошибок и битых секторов (BAD Sector), обычно восстанавливает "мягкие" битые сектора, и маркирует "жёсткие" таким образом, чтобы они не могли быть далее использованы системой. Если диск системный, то проверка будет произведена при последющей перезагрузки. \
`/F` выполнение проверки на наличие системных ошибок и их автоматическое исправление; \
`/R` выполнить поиск поврежденных секторов и восстановить их содержимое; \
`/X` предварительное отключение тома, принудительно закрыв все открытые файловые дескрипторы; \
`/B` повторная проверка повреждённых кластеров диска. \
Четыре прохода: \
Этап 1 - проверка файлов \
Этап 2 - проверка индексов \
Этап 3 - проверка дескрипторов безопасности \
Этап 4 - проверка секторов

### Diskpart:
`list disk` список дисков и тип диска \
`MBR (Master Boot Record/BIOS)` имеет 2 раздела \
`GPT (GUID Partion Table/UEFI)` имеет 3 раздела (Boot, Recovery Partion и загрузочный EFI System Partition с ФС FAT32 100MB) \
`Dyn` динамический диск (Soft RAID) \
`list volume` разделы и тип файловой системой \
`select disk 0` выбрать диск \
`clean` очистить диск \
`convert gpt/mbr` преобразовать диск \
`select volume 3` выбрать раздел \
`list part (partition)` список разделов на диске (если выбран диск) \
`select part 3` выбрать раздел \
`active` сделать активным \
`delete part` удалить раздел \
`create part primary` создать раздел \
`format fs=ntfs quick` отформатировать в указанную Файловую систему \
`assign letter D` присвоить букву E разделу \
`remove letter D` удалить букву \
`Exit`

### FSutil
`fsutil fsinfo ntfsinfo C:` узнать размер сектора и кластера

### Mbr2gpt
`Mbr2gpt.exe` – позволяет сконвертировать диск с таблицей разделов MBR в таблицу GPT без потери данных и без необходимости удаления существующих разделов на диске \
`mbr2gpt.exe /disk:0 /validate /Logs:C:\logs /allowFullOS` \
`mbr2gpt.exe /convert /disk:0 /allowFullOS` \
`/validate` выполняется только проверка диска на возможность конвертации таблицы разделов (в том числе выполняется проверка, достаточно ли места для хранения основной и вторичной таблицы GPT: 16Кб + 2 сектора в начале диска и 16Кб + 1 сектор в конце) \
`/convert` запуск преобразования диска, при условии успешной валидации \
`/allowFullOS` по умолчанию утилита MBR2GPT запускается только в среде выполнения Windows PE. С помощью ключа allowFullOS можно запускать конвертацию системного раздела непосредествнно из запущенной Windows 10

### DISM
`Deployment Image Servicing and Management` - инструмент для работы с образом WIM (Windows IMaging Format) \
`dism /image:C: /Get-Drivers` отобразить список драйверов, внешнему драйверу vioscsi.inf присвоен информационный файл oem36.inf \
`dism /image:C: /Remove-Driver /Driver:oem36.inf` удаление драйвера из образа (из winPE) \
`dism /image:C: /Get-CurrentEdition` узнать версию ОС \
`cd Y:\customdrivers\vioscsi\2k16\amd64` перейти в директорию \
`Y:` сменить диск \
`dir` содержимое директории \
`dism /image:C: /add-driver /driver:vioscsi.inf` установить драйвер

`dism /Online /Cleanup-Image /CheckHealth` проверка \
`dism /Online /Cleanup-Image /ScanHealth` сканирование \
`dism /Online /Cleanup-Image /RestoreHealth` восстановление образа Windows, загрузка, с заменой поврежденных системых файлов \
`dism /image:C: /Cleanup-Image /RestoreHealth` при загрузке с winPE \
`Dism /image:C: /Cleanup-Image /RestoreHealth /Source:WIM:D:\sources\install.wim:6` из смотнированного образа ОС \
`Get-WindowsImage -ImagePath D:\sources\install.wim` узнать ImageIndex нужной версии ОС (powershell)

### PNPutil
`pnputil /enum-drivers` отобразить список драйверов \
`pnputil /delete-driver oem4.inf /force` удалить драйвер по Published Name \
`pnputil /add-driver C:\Install\Drivers\vz-guest-tools-win\vioscsi\2k16\amd64\*.inf /install` установить драйвер \
`pnputil.exe -i -a C:\Distr\HP-pcl6-x64\hpcu118u.inf` установить драйвер принтера

### Bootrec
`bootrec /fixmbr` восстановление загрузчика BIOS (MBR) \
`bootrec /fixboot` перезаписать загрузочную запись раздела \
`bootrec /scanos` найти установленные ОС \
`bootrec /rebuildbcd` добавить их в BCD

### sfc
`sfc /scannow` обнаруживает любые поврежденные или отсутствующие системные файлы Windows, будет автоматически заменять их, используя кэшированные копии из хранилища системных компонентов Windows (каталог C:\Windows\WinSxS).

### BCDBoot
Позволяет восстановить файлы загрузчика на системном разделе, скопировав их из системного каталога на разделе с Windows. Конфигурация загрузчика BCD пересоздается с помощью шаблона %WINDIR%\System32\Config\BCD-Template \
Загрузиться с iso образа ОС, Shift+F10 открыть cmd в diskpart узнать букву диска с Windows  \
Автоматическое восстановление загрузчика UEFI (GPT): \
`bcdboot C:\windows` \
Ручное восстановление: \
`assign letter M` присвоить букву загрузочному разделу System Partition в diskpart \
`cd /d m:\efi\microsoft\boot\` открыть раздел загрузчика UEFI где находится BCD \
`attrib BCD -s -h -r` снять атрибуты скрытый, только чтение (read-only) и системный с файла BCD \
`bcdboot C:\Windows /l en-us /s m: /f ALL` пересоздать хранилище BCD \
`C:\Windows` путь к каталогу на диске, на котором установлена Windows 10 \
`/f ALL` означает что необходимо скопировать файлы среды загрузки Windows, включая файлы для компьютеров с UEFI или BIOS (теоретическая возможность загружаться на EFI и BIOS системах). Чтобы скопировать только EFI загрузчик, используйте команду /f UEFI \
`/l en-us` тип системной локали. По умолчанию используется en-us — английский язык (США) или ru-ru \
`/с` новая опция BCDBoot в Windows 10, которая позволяет перезатереть имеющиеся загрузочные записи при создании нового хранилища (в том числе debugsettings). Используйте этот параметр, чтобы игнорировать старые настройки и создать полностью чистую конфигурацию BCD загрузчика \
`/v` используется для включения режима вывода подробной информации BCDBoot

### Ports:
`6` - протокол TCP (Transmission Control Protocol); \
`17` - протокол UDP (User Datagram Protocol); \
`20/TCP` - передача данных FTP (File Transfer Protocol); \
`21/TCP` - передача команд FTP (File Transfer Protocol); \
`22/TCP` - SSH (Secure SHell) и SCP (Secure Copy Command); \
`23/TCP` - Telnet; \
`25/TCP` - SMTP (Simple Mail Transfer Protocol) для передачи почты на почтовый сервер и для пересылки между почтовыми серверами; \
`50/UDP` - IPSec ESP; \
`53/TCP/UDP` - DNS (Domain Name System); \
`67/UDP` - DHCP (Dynamic Host Configuration Protocol) сообщения от клиента к серверу; \
`68/UDP` - DHCP (Dynamic Host Configuration Protocol) сообщения от сервера клиенту; \
`69/UPD` - TFTP (Trivial File Transfer Protocol); \
`80/TCP` - HTTP (HyperText Transfer Protocol); \
`88/TCP/UDP` - Kerberos. Используется в доверительных отношениях между лесами; \
`110/TCP` - POP3 (Internet Message Access Protocol) - клиент забирает письмо себе и посылает запрос на удаление его с сервера; \
`123/UDP` - NTP (Network Time Protocol); \
`135/TCP/UDP` - WMI (Windows Management Instrumentation) работает через RPC (Remote Procedure Call); \
`137/UDP` - служба имен NETBIOS, тип трафика NetLogon для аутентификации пользователя и компьютера; \
`138/TCP/UDP` - служба дейтаграмм NETBIOS, тип трафика DFSN, NetLogon для DFS, групповых политик; \
`139/TCP/UDP` - сессия NETBIOS, аутентификация пользователя и компьютера, репликация; \
`143/TCP` - IMAP4 (Internet Message Access Protocol) - у клиента отображается копия почтового ящика, который хранится на почтовом сервере; \
`161/UDP` - подключение SNMP, отправки запросов (TLS 10161); \
`162/UDP` - передача информации SNMP, отправки Trap и Inform (TLS 10162); \
`389/TCP/UDP` - LDAP (Lightweight Directory Access Protocol); \
`443/TCP` - HTTPS с шифрованием SSL или TLS; \
`445/TCP` - SMB (Server Message Block) и RD Shadow; \
`464/TCP/UDP` -  Kerberos PCR, через него проходит трафик смены пароля пользователя; \
`500/UDP` - IKEv1 и IKEv2 (Internet Key Exchange) используется для IPsec SA (Security Association - политики безопасности); \
`514/TCP` - Syslog; \
`554/TCP` - RTSP (Real Time Streaming Protocol) — предназначенный для использования в системах, работающих с мультимедийными данными (ip-камеры); \
`587/TCP` - SMTPS; \
`593/TCP` - RPC; \
`623/UDP` - IPMI (Intelligent Platform Management Interface); \
`636/TCP` - LDAPS; \
`860/TCP/UDP` - iSCSI (Internet Small Computer Systems Interface); \
`873/TCP` - Rsync (Remote Synchronization); \
`989,990/TCP` - FTPS; \
`993/TCP` - IMAPS; \
`995/TCP` - POP3S; \
`1080/TCP` - Socks Proxy; \
`1194/UDP` - OpenVPN; \
`1433/TCP` - MSSQL Server; \
`1521/TCP` - Oracle Net Listener для подключения клиентов к БД; \
`1540/TCP` - 1C Агент Сервера. Консоль кластера соединяется с центральным сервером для выполнения административных функций (не обязательно, если ЦС кластера один); \
`1541/TCP` - Менеджер кластера 1С. Для соединения клиентских приложений с информационными базами, зарегистрированными в кластере; \
`1560-1591/TCP` - при запуске рабочих процессов кластера на данном сервере будут динамически назначаться IP-порты из указанного диапазона; \
`1645/TCP` - NPS (RADIUS) для проверки подлинности; \
`1646/TCP` - NPS (RADIUS) для учетных данных; \
`1688/TCP` - KMS Server; \
`1701/UDP` - L2TP (Layer 2 Tunneling Protocol); \
`1721/TCP` - PPTP VPN (совместно с протоколом GRE 47); \
`1723/TCP/UDP` – Microsoft Point-to-Point Tunneling Protocol (PPTP); \
`1725/UDP` - Valve Steam Client; \
`1812/TCP` - NPS (RADIUS) для проверки подлинности; \
`1813/TCP` - NPS (RADIUS) для учетных данных; \
`2049/UDP` - NFS (Network File System) - сервер получает запросы от клиента в виде UDP-датаграмм и работает с преобразователем портов; \
`3260/TCP` - iSCSI Target; \
`3268/TCP` - LDAP для Global Catalog; \
`3269/TCP` - LDAP защищенный для Global Catalog; \
`3306/TCP` - MySQL сервер; \
`3391/UDP` - транспортный UDP-порт шлюза RDGW; \
`3389/TCP` - RDP (Remote Desktop Protocol); \
`4011/TCP` - PXE (Preboot eXecution Environment) - протокол загрузки по сети, находится в ПЗУ сетевой карты, получает по протоколу TFTP; \
`4500/UDP` - IKEv2 (IPsec NAT traversal); \
`4899/TCP/UDP` - Radmin; \
`5022/TCP` - MSSQL синхронизация AlweysOn; \
`5044/TCP` - Logstash for Elasticsearch; \
`5060/TCP` - SIP (Session Initiation Protocol); \
`5201/TCP/UPD` - iperf3 default; \
`5432/TCP` - PostgreSQL Server; \
`5601/TCP` - Kibana Web Server for Elasticsearch; \
`5722/TCP` - тип трафика RPC, DFSR (SYSVOL) для репликации файлов; \
`5985/TCP` - WinRM PSRemoting через HTTP; \
`5986/TCP` - WinRM PSSession через HTTPS; \
`8083,8086,8090,8099` - InfluxDB; \
`8291/TCP` - WinBox; \
`8530/TCP` - WSUS HTTP; \
`8531/TCP` - WSUS HTTPS; \
`9200/TCP` - Elasticsearch (NOSQL); \
`32400/TCP` - Plex Media Server; \
`10050/TCP` - Zabbix Agent; \
`10051/TCP` - Zabbix Agent; \
`3306/TCP` - Galera Cluster для подключения клиента MySQL; \
`4444/TCP` - Galera Cluster для передачи моментальных снимков состояния MySQL; \
`4567/TCP` - Galera Cluster для трафика репликации кластера MySQL; \
`4568/TCP` - Galera Cluster для инкрементной передачи состояния MySQL.
