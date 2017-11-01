n="\033[0m"
r="\033[1;31m"
g="\033[1;32m"
y="\033[1;33m"
echo -e "                          ${y}Welcome to script"
echo -e "                       Write by Mahmoud khalid${n}"
helper (){
  echo -e "${g}[+] create -- Create a new account"
  echo -e "[+] search -- Search in database account"
  echo -e "[+] show   -- Display all account"
  echo -e "[+] help   -- Helper list${n}"
}
helper
printf "\n"
echo "%%%%%%%%%%%%%   Login account   %%%%%%%%%%%%%"
printf "\n"
read -p "Enter Username : " Username
read -p "Enter Password : " Password
if [ $Username == "admin" -a $Password == "admin" ]; then
  while true
  do
    read -p "Shell # " Shell
    if [ $Shell == "show" ]; then
      showdb=`tail newaccount.txt`
      echo -e "${y}$showdb${n}"
    elif [ $Shell == "create" ]; then
      read -p "Username: " user
      read -p "Passowrd: " password
      read -p "Site Name: " site
      echo "$user,$password,$site" >> newaccount.txt
      echo -e "${g}Success create${n} $user $password $site"
    elif [ $Shell == "search" ]; then
      read -p "Username: " acc
      get=`cat newaccount.txt | grep $acc`
      echo -e "${g} $get ${n}"
    elif [ $Shell == "help" ]; then
      helper
    else
      echo -e "${r}this code is not found${n}"
    fi
  done
elif [ -z $Username -a -z $Password ]; then
  echo -e "${r}Username or Password not write${n}"
else
  echo -e "${r}Username or password is wrong${n}"
fi
