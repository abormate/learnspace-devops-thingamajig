sudo curl https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz --output /opt/openjdk-13.0.2_linux-x64_bin.tar.gz

sudo tar -xf /opt/openjdk-13.0.2_linux-x64_bin.tar.gz -C /opt/
  
// assign to path
  
export PATH=$PATH:/opt/jdk-13.0.2/bin
  
  
