#Fedena Installation Script 

The official fedena installation guide is not fully documented.So,here i have released fully working installation script.I have tested in **Ubuntu Server 12.04.1 LTS 64 bit  in AWS-ec2** and it is working fine. 


##Installation
  
 
### For ubuntu or Debian
1. Just ssh to your server , make a/c say `deployer` with `sudo` permission .
2. Run the below command in home directory
  1. First install the  required fedena dependency . 

            curl https://raw.github.com/passion8/fedena-install/master/required.sh | sudo bash

  2. Now, install fedena finally

            curl https://raw.github.com/passion8/fedena-install/master/fedena-related.sh | sudo bash


The above command will take you straight to `Phussion Passenger installation` with fedena in `~/fedena` 

### You can also install it with RVM 
 please go to  [with_rvm](https://github.com/passion8/fedena-install/tree/with_rvm) branch.
## Caveats 
 1. This installation will remove all your installed gems .
 2. This gem will downgrade `rubygems` . 

## If you're having some problem , follow 
  
    http://paritosh.passion8.co.in/post/49878771105/fedena-installation-guide
  
##Contribution :thumbsup:
 * log support
 * Centos support script welcome . 
 * Code Refactoring
 * Code Commenting


Enjoy :smiley: