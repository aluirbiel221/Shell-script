
#!/bin/bash
clear;
echo "Instala Gerencidor que armazena senhas Linux."
sudo apt-get install sshpass -y;
sudo apt-get install samba -y;
sudo apt-get install libreoffice-gnome -y;
sudo apt-get install boomaga -y;
sudo apt-get install gwenview -y;
sudo apt-get install remmina -y;
sudo apt-get install -f;
cd /home/$USER/Imagens;


sudo wget -m -r -nd ftp://portalgeracao:GeracaoFTP.1212@geracaoautomoveis.com.br/public_html/manualLinux/fundo-2.jpg
#sftp portalgeracao@187.45.240.15:public_html/manualLinux/fundo-2.jpg;

cd /usr/share/xfce4/backdrops/;
sudo rm *;
sudo cp /home/$USER/Imagens/fundo* .;
clear;
cd /home/$USER/Downloads;

sudo wget -m  -r  -nd ftp://portalgeracao:GeracaoFTP.1212@geracaoautomoveis.com.br/public_html/manualLinux/jre-linux.tar.gz;
#sftp portalgeracao@187.45.240.15:public_html/manualLinux/jre-linux.tar.gz;

clear;
echo "Instalando o Java";
sudo mkdir /usr/lib/jvm;
sudo tar zxvf /home/$USER/Downloads/jre-linux.tar.gz -C /usr/lib/jvm;
sudo mv /usr/lib/jvm/jre*/ /usr/lib/jvm/jre;
sudo ln -s /usr/lib/jvm/jre /usr/lib/jvm/java-oracle;
sudo cp -a /etc/profile /etc/profile.original;
clear;
echo "Inalatando SSH";
sudo apt-get install openssh-server -y;
sudo /etc/init.d/ssh stop;
sudo /etc/init.d/ssh start;
clear;
#setando variaveis sistema
echo "export WINEPREFIX=/home/$USER/nbs" >> /home/$USER/.profile;
echo "export WINEARCH=win32" >> /home/$USER/.profile;
echo "JAVA_HOME=/usr/lib/jvm/java-oracle/" >> /home/$USER/.profile;
echo "PATH=$JAVA_HOME/bin:$PATH export PATH JAVA_HOME" >> /home/$USER/.profile;
echo "CLASSPATH=$JAVA_HOME/lib/tools.jar" >> /home/$USER/.profile;
echo "CLASSPATH=.:$CLASSPATH" >> /home/$USER/.profile;
echo "export  JAVA_HOME  PATH  CLASSPATH" >> /home/$USER/.profile;
source /home/$USER/.profile;
echo $WINEARCH;
echo "Confira se Variavel esta setada para win32, caso contrário rode source /home/$USER/.profile";

