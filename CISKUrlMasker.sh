url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Please use http or https.\e[0m"
            exit 1
        fi
    fi
}

echo -e "\n\e[1;31;42m######  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ //##### \e[0m"
echo -e "\e[1;31;42m######    ██░▄▄▀█▄░▄██░▄▄▄░██░█▀▄█ //##### \e[0m"
echo -e "\e[1;31;42m######    ██░█████░███▄▄▄▀▀██░▄▀██ //##### \e[0m"
echo -e "\e[1;31;42m######    ██░▀▀▄█▀░▀██░▀▀▀░██░██░█ //##### \e[0m"
echo -e "\e[1;31;42m######    ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ //##### \e[0m"
echo -e "\e[1;31;42m######   └──────────By Vansh───────┘##### \e[0m \n"
echo -n "It is made by Student(Vansh) of Cambridge international School Kullu Hp  "
echo -n "Paste Your URL Bellow (with http or https): "
read phish
url_checker $phish
sleep 1
echo "Processing and Modifing URL"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Masking URl ###\e[0m"
echo ' Real URL to Masked URL (with http or https), ex: https://google.com to http
://anything.org) :'
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nType words to be in MaskedURl:(like CISK.co.in Gmail.com,etc)'
echo -e "\e[31mDonot use space Pls use '-' Only\e[0m"
echo -en "\e[32m=>\e[0m "
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m[!] No words.\e[0m"
echo -e "\nGenerating Masked Link...\n"
final=$mask@$shorter
echo -e "Here is the Masked URL:\e[32m ${final} \e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "\e[31m[!] Invalid words. Please avoid space.\e[0m"
echo -e "\nGenerating Masked Link...\n"
final=$mask@$shorter
echo -e "Here is the Masked URL:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGenerating Masked Link...\n"
final=$mask-$words@$shorter
echo -e "Here is the Masked URL:\e[32m ${final} \e[0m\n"
