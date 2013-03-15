#Fedena Installation Script 

The official fedena installation guide is not fully documented.So,here i have released fully working installation script.I have tested in Ubuntu Server 12.04.1 LTS 64 bit  in AWS-ec2 and it is working fine. 

##Features 
* RVM Support
* Apache with Phussion Passenger 
* Fully Automated

##Installation 
 
### For ubuntu or Debian
Just ssh to your server , make a/c say `deployer` with `sudo` permission and run the below command
    curl https://raw.github.com/Passionate/fedena-install/master/ubuntu_root_cmds.sh | bash 
The above command will take you straight to `Phussion Passenger installation` with fedena in `~/fedena` 

##Contribution :thumbsup:
 * log support
 * Centos support script welcome . 
 * Code Refactoring
 * Code Commenting


Enjoy :smiley: