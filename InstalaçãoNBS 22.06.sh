#!/bin/bash

#Verificando Arquitetura
source /home/$USER/.profile;
echo "Esta é sua Arquitetura";
echo $WINEARCH;
sleep 3;

sudo rm -r /home/$USER/nbs;
sudo rm -r /home/$USER/bin;

mkdir /home/$USER/nbs;
mkdir /home/$USER/bin/;

#Atualizando Repositórios e SO
#sleep 3;
#sudo apt update && sudo apt dist-upgrade -y;
#sudo apt autoremove -y;

#Acionando arquitetura 32bits
sleep 3;
echo "Acionando arquitetura 32bits";
sudo dpkg --add-architecture i386;

#Instalando Wine
#clear;
#echo "Instalando Wine";
#sleep 3;
#cd /home/$USER/Downloads/;
#rm Release.key;
#wget -nc https://dl.winehq.org/wine-builds/Release.key;
#sudo apt-key add Release.key;
#sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 76F1A20FF987672F
#sudo apt update;
#sudo apt-get install --install-recommends winehq-stable -y;
#sudo apt-get install wine-mono0.0.8 -y;
#sudo apt-get install -f;
#sudo apt autoremove;
#sudo apt-get clean;
#sudo apt-get update;


cd /home/$USER/bin;
wget -m  -r  -nd ftp://portalgeracao:GeracaoFTP.1212@ftp.portalgeracao.hospedagemdesites.ws/public_html/manualLinux/nbs;

#sftp portalgeracao@187.45.240.15:public_html/manualLinux/nbs;

chmod ugo+x /home/$USER/bin/nbs;
cd /home/$USER/Área\ de\ Trabalho;

wget -m  -r  -nd ftp://portalgeracao:GeracaoFTP.1212@ftp.portalgeracao.hospedagemdesites.ws/public_html/manualLinux/NBS.desktop;

#sftp portalgeracao@187.45.240.15:public_html/manualLinux/NBS.desktop

cd /home/$USER/nbs/;
sudo chmod 777 *;
rm *.reg;


sudo wget -m  -r  -nd ftp://portalgeracao:GeracaoFTP.1212@ftp.portalgeracao.hospedagemdesites.ws/public_html/manualLinux/*.reg;

#sftp portalgeracao@187.45.240.15:public_html/manualLinux/*.reg;

sudo chmod 777 *;
echo "$(sed 's/$USER/'$USER'/g' userdef.reg)" > userdef.reg;
echo "$(sed 's/$USER/'$USER'/g' user.reg)" > user.reg;
winecfg;

#Acordando Paths Wine
sudo mkdir /home/$USER/nbs/drive_c/desktop;
sudo mkdir /home/$USER/nbs/drive_c/meus_documentos;
sudo mkdir /home/$USER/nbs/drive_c/imagens;
sudo mkdir /home/$USER/nbs/drive_c/musicas;
sudo mkdir /home/$USER/nbs/drive_c/videos;
sudo mkdir /home/$USER/nbs/drive_c/temp;


#Instala NBS
clear;
echo "Instalando NBS";
sleep 3;

cd /home/$USER/nbs/drive_c/users/$USER;
sudo rm Meus\ Vídeos;
sudo rm Área\ de\ Trabalho;
sudo rm Meus\ Documentos;
sudo rm Minhas\ Imagens;
sudo rm Minhas\ Músicas;
sudo ln -s /home/$USER/nbs/drive_c/videos  /home/$USER/nbs/drive_c/users/$USER/Meus\ Vídeos;
sudo ln -s /home/$USER/nbs/drive_c/desktop /home/$USER/nbs/drive_c/users/$USER/Área\ de\ Trabalho;
sudo ln -s /home/$USER/nbs/drive_c/meus_documentos /home/$USER/nbs/drive_c/users/$USER/Meus\ Documentos;
sudo ln -s /home/$USER/nbs/drive_c/imagens /home/$USER/nbs/drive_c/users/$USER/Minhas\ Imagens;
sudo ln -s /home/$USER/nbs/drive_c/musicas /home/$USER/nbs/drive_c/users/$USER/Minhas\ Músicas;
rm -f "/home/$USER/nbs/dosdevices/z:";

# Instalando BDE
clear;
echo "Instalando BDE";
sleep 3;
mkdir /home/$USER/nbs/drive_c/temp;
cd /home/$USER/nbs/drive_c/temp;


sudo wget -r  -nd ftp://portalgeracao:GeracaoFTP.1212@ftp.portalgeracao.hospedagemdesites.ws/public_html/BDE/BDE.tar;
#sftp portalgeracao@187.45.240.15:public_html/BDE/BDE.tar;

sudo tar -xvf BDE.tar;
sudo mkdir /home/$USER/nbs/drive_c/oracle;
cd /home/$USER/nbs/drive_c/oracle/;

sudo wget -m  -r  -nd ftp://portalgeracao:GeracaoFTP.1212@ftp.portalgeracao.hospedagemdesites.ws/public_html/BDE/instantclient_10_2.tar;
#sftp portalgeracao@187.45.240.15:public_html/BDE/instantclient_10_2.tar;


sudo tar -xvf instantclient_10_2.tar;
cd /home/$USER/nbs/drive_c/temp;
wine Setup_BDE52_PTB.exe;
cd /home/$USER/nbs/drive_c;
cd Program\ Files;
cd Common\ Files;
cd Borland\ Shared;
cd BDE;
mv IDAPI32.CFG IDAPI32.ORG;

sudo wget -r  -nd ftp://portalgeracao:GeracaoFTP.1212@ftp.portalgeracao.hospedagemdesites.ws/public_html/manualLinux/bdeconfiguracao.CFG;
#sftp portalgeracao@187.45.240.15:public_html/manualLinux/bdeconfiguracao.CFG;


cp bdeconfiguracao.CFG  IDAPI32.CFG;

#Baixando Modulos NBS
clear;
echo "Baixando Modulos NBS";
sleep 3;
cd /home/$USER/nbs/drive_c;
mkdir NBS
cd NBS


sudo wget -r  -nd ftp://portalgeracao:GeracaoFTP.1212@ftp.portalgeracao.hospedagemdesites.ws/public_html/NBS/atualizados/*
#sftp portalgeracao@187.45.240.15:public_html/NBS/nbs.zip;


#unzip nbs.zip;

cd /home/$USER/Downloads/;
sudo rm -r Wine;
sudo rm *.deb;
sudo rm *.tgz;
sudo rm *.gz;
sudo apt-get remove --auto-remove gnome-keyring -y;


