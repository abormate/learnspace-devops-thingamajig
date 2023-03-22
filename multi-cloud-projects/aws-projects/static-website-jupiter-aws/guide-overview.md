# Host a load-balanced static website on AWS 

![Jupiter_Project_Reference_Architecture](https://user-images.githubusercontent.com/53473761/226775379-935246b7-eb97-4500-908d-6d241350d6d7.jpg)

Step 01 -- First, we provision the needed VPC and 3-level Sub-net networking infrastructure. And define redundancies to boost availability.


![VPC_Reference_Architecture](https://user-images.githubusercontent.com/53473761/226775649-b191d344-e17b-4441-a868-2ca9fee08221.jpg)

Step 02 -- Create a NAT gateway

Step 03 -- Create Security Groups

Step 04 -- Create an Application Load Balancer

Step 05 -- Register a new Domain Name with Route53

Step 06 -- Create a DNS record set in Route53

Step 07 -- Register an SSL certificate with AWS Certificate Manager

Step 08 -- Create a HTTPS listener for Application Load Balancer

Step 09 -- Create an autoscaling group