echo -e "\e[1;46m Fixing in Progress..... \e[0m"
cd
rm -rf avistnm-Ruby-Fixer-Metasploit
apt remove -y ruby
apt install -y ./ruby.deb
apt install -y ./rubyarm.deb
cd metasploit-framework
bundle config build.nokogiri --use-system-libraries 
bundle install
bundle update
cd
rm ruby.deb
rm rubyarm.deb
rm README.md
echo -e "\e[1;46m Fixing Over!! \e[0m"
echo -e "\e[1;42m Run msfconsole to Start metasploit framework.... \e[0m"
