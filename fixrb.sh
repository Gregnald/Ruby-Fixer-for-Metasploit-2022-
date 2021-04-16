echo -e "\e[1;46m Fixing in Progress..... \e[0m"
cd
rm -rf avistnm-Ruby-Fixer-Metasploit  >/dev/null 2>&1

#arch check
arc=$(dpkg --print-architecture)

#ruby remove
apt remove -y ruby >/dev/null 2>&1

#ruby 2.7.0 install
cd >/dev/null 2>&1
if [[ $arc = "aarch64" ]];
then
apt install -y --allow-downgrades ./ruby.deb >/dev/null 2>&1
elif [[ $arc = "arm" ]];
then
apt install -y --allow-downgrades ./rubyarm.deb >/dev/null 2>&1
else
break;
fi

cd metasploit-framework
bundle config build.nokogiri --use-system-libraries  >/dev/null 2>&1
bundle install >/dev/null 2>&1
bundle update >/dev/null 2>&1

cd
rm ruby.deb >/dev/null 2>&1
rm rubyarm.deb >/dev/null 2>&1
rm README.md >/dev/null 2>&1
echo -e "\e[1;46m Fixing Over!! \e[0m"
echo -e "\e[1;42m Run msfconsole to Start metasploit framework.... \e[0m"
