---
layout: single
title: Caso de Ransonware en un particular
excerpt: "Cómo se vivió el ataque de un ransomware en la casa de un familiar, desde inicio a fin"
date: 2022-02-27
classes: wide
header:
  teaser: /assets/images/ransom/insignia.jpg
  teaser_home_page: true
categories:
  - Ransomware
tags:
  - Forensics

---

<p align="center">
<img src="/assets/images/ransom/insignia.jpg" width=200>
</p>


## Comienzo del problema

Un familiar intentó ordenar su computador por medio de una herramienta que ella conocía.
Ccleaner.

Para sacar mejor provecho de la herramienta, buscó una versión registrada online.

De esa forma llegó a este sitio, de donde descargó un archivo rar con contraseña.

## Telegram Parte I.

Al momento de ejecutar el software, llegó una notificación a su teléfono que telegram. Estaba entregando un número de seguridad..

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/WQJg_OYG-A6pgZ">
</p>

Este mensaje estaba en ruso y la traducción via google nos explicó la situación.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/WB2z45ECVwI95m">
</p>


Le sugerí que no hiciera acciones adicionales, dado que simplemente estaban intentando
hackearla, pero no lo lograrán a menos que consiguieran ese número.

Ese intento de conexión murió en ese paso tal como indica el capturado.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/kNz6_SojKQu3jW">
</p>


<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/yL25KWQRlYXL0U">
</p>


## Análisis de la IP
<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/ozvnu0_gRzCCle">
</p>

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/CcdrYuObdFjs-G">
</p>

Aún cuando tiene más puertos abiertos que apuntan a un debian, el puerto 3128 corresponde a un administrador web de máquinas virtuales.
<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/869_ccl0HVakQ5">
</p>

nmap muestra que los puertos abiertos correponden a escritorios remotos virtuales de varios windows diferentes lo que posiblemente pueda ser un Command and Control de
varios bots locales.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/nhhMljSM0LilY5">
</p>

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/uUahVTLkkfsiaM">
</p>



"posible investigación futura a realizar"

En este momento aún no sabía qué es lo que estaba pasando en su computador.


## El Notebook
Al rato me pidió ayuda.

El antivirus de su computadora estaba teniendo una pelea con un malware que intentaba
deshabilitarlo mientras el AV intentaba eliminar el archivo comprometido.

El mensaje de malware apuntaba a un crypto.MTB, por lo que lo desconecté de la red
para seguir la revisión. Le comenté a Gise que podíamos estar frente a un ransomware.

Nota Importante: windows 10 estaba actualizado al día tanto de parches críticos como de
definiciones de antivirus.

Mi familiar me contó lo que estaba haciendo y eliminamos el archivo ejecutable. Ahora
tocaba identificar todo lo que se instaló.

## El Ransomware

Mientras miraba de forma manual los registros y las carpetas nuevas, gatillé la revisión
FULL del antivirus, que estaba actualizado hasta un poco antes de haberlo desconectado.

Aparecieron más de 10 archivos de malwares diferentes y varios procesos detenidos.

También intenté detectar y eliminar procesos de estuviera corriendo y que no reconociera,
así como cualquier cosa que haya quedado en el inicio o servicio habilitado.

Luego de un reinicio, veo en el escritorio que algunas iconos habían perdido su formato,
por lo que revisé las extensiones y tal como se puede asumir, ya estaban cifrados. La
extensión era .fgui y según internet aún no hay decrypters liberados.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/y0cJQgL2XGjrTU">
</p>


Los documentos cifrados en el computador no importaban mucho, dado que existía
respaldo en su NAS y en la nube.

Ahora deberemos revisar el NAS, dado que estaba mapeado directo como unidad de red al
equipo infectado.

De vuelta al notebook, tomé las evidencias del link de descarga y unas muestras del
ransomware y formateamos el computador completo. No había nada que necesitara
rescatarse.


## EL NAS (Network Attacked Storage)

Para nuestro asombro sólo la carpeta raiz y unas cuantas sin importancia fueron afectadas.
El resto no sufrió cifrado. Aparentemente desconectamos la red del notebook a tiempo.

Programamos una revisión de antivirus full para el Nas, por si el malware dejó alguna
sorpresa allí.

## Genshin Impact
Lo único que le preocupaba a Gise era que no le hayan intervenido su Cuenta de Genshin
Impact, que es un juego al que le ha dedicado muchísimo tiempo.

Tristemente las noticias no fueron buenas. Al momento de loguearse desde su table, el
número de verificación que le solició para validar su cuenta estaba siendo enviado, según
mostraba la ventana, aun correo ruso (@rambler.ru)

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/8Ji_Q1vX2mmxEK">
</p>


Googleamos hasta dar con el protocolo para reportar una cuenta hackeada en la
plataforma de Hoyoverse.com

Mientras lamentábamos la pérdida, para evitar otras cuentas comprometidas, comenzó el
proceso de cambio de contraseñas de todos los servicios.

El cambio de contraseñas duró hasta las 01:AM

## Análisis del Correo
<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/fNuERI-SLq9Mkv">
</p>



## Investigación de cuentas Hackeadas de Genshin Impact

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/_ok1R4Xn--CmVv">
</p>


## Telegram parte II.

8:50AM del siguiente día una respuesta a un mensaje en telegram alerta nuevamente.

Al revisar los mensajes, desde la cuenta de gise se habían enviado unos 20 mensajes de
spam anti-putin a destinatarios desconocidos pero claramente atingentes al conflicto.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/TbMXGcc_awCikQ">
</p>


<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/Uv1G3gd5k5KPo9">
</p>


Por curiosidad traduje el texto para entender de qué se trataba.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/9V3GUI9txJ2VuU">
</p>


Al mirar en los dispositivos conectados, aparece la IP del intento del día anterior (sin
terminar la conexión) pero además una conexión exitosa desde estados unidos.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/-qS5BtADE2vdTE">
</p>


Saqué las evidencias correspondientes y desconecté las sesiones foraneas. Mientras le
exigía al soporte de telegram que antediera el asunto, dado que se había iniciado una
sesión extranjera sin darme aviso, ni proveyendo número de verificación.

## Análisis de la IP


<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/brN3ZvnPxnQihS">
</p>


Simultáneamente con este descubrimientoi apareció un mensaje de un bot de telegram
llamado Spam Info bot.

Luego de validar su legitimidad, observamos que lo que nos quería advertir era que
telegram había recibido varias denuncias a nuestra cuenta.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/yc428DTIGmdzUn">
</p>


Esta nos indicó que nuestra cuenta estaba bloqueada por el propio servidor de Telegram
por enviar Spam y será restringida a solo enviar mensajes a contactos conocidos. Ninguno
nuevo, hasta el 3 de marzo. Por lo que no podemos estas 100% seguros que la cuenta no
siga intervenida, aun cuando ya no pareciera tener mensajes sospechosos.

Quedamos coordinando para revisión cada par de horas de las sesiones activas para ver si
hay novedades.

## Instagram

Esto último gatilló una segunda revisión de las redes sociales por parte de Gisela, descubriendo
otra sorpresa.

En su Instagram aparecieron cientos de nuevos seguidos, de europa oriental.

Aquí varios capturados consecutivos con un minutos de diferencia.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/Y_Z2yjL4KrU8br">
</p>


Su registro de sesiones no muestra conexiones foraneas, por lo que sospecho que los
maleantes conocen una forma de conseguir seguir otras por medio de un token o ID que
no es la password del usuario.

15:30 luego de dejar de seguir a varias cuentas de instragram llevando, notamos que
varias volvieron a aparecer, por lo que pareciera que Instragram sigue comprometido.

16:40 desactivamos la cuenta de instagram con el plan de reportarlo al soporte técnico.

Comenzamos en análsis forense con la evidencia recolectada a modo de identificar los
posibles vectores utilizados y si es necesario gatillar alguna accion adicional.

## El malware
https://pastepvp.org/?v=3
CCIeaner Professional I Business I Technician 5.90.9443 Enlaces de descarga https://drive.google.com/file/d/1HWH60PkDsRJ3fz1yxpPlWSbUd4jGlS C/view?usp=sharing https://mega.nz/file/phISOK4T#7WWPhqzpOSlDH_VQdxIVm2-CXthEe6pbGnOgpgJdi8g https://wmu.mediafire.com/file/oq80hi609ac6w2r/5.90.9443-PVP.rar/fiIe Reportar Error Visitas 249474

Los links dirigen a otro sitio, que no corresponde a los enumerados allí.

<p>
<img src="https://eus-www.sway-cdn.com/s/SPfclgMu37DM8iIF/images/Nd5jx1g2FrN4Dv">
</p>


Al final llega a un archivo descargable.

https://drive.google.com/file/d/1HWH6oPkDsRJ3fz1yxpPlWSbUd4jGlS_C/view

https://mega.nz/file/phlS0K4T#7WWPhqzpOSIDH_VQdxlVm2-
CXthEe6pbGn0gpgJdi8g

El análisis forense del malware lo dejaré para otro artículo.


## Conclusiones.

Evitar a toda costa ejecutar software creackeado, pirata, de origen desconocido o programas portables o parchados.
Mantener respaldada la información sensible y custodiar la información privada.

Seguir estos consejos dado que hay información valiosa que no se reconoce o no parece interesante, hasta que se pierde o se usa en su contra.
Siempre mantenerse atentos.
