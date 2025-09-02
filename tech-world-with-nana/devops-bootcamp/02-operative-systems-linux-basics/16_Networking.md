### 16 - Networking


### 16.1  LAN, Switch, Router, WAN, Gateway

- LAN: Local Area network
	- Collection of devices connected together in one physical localion
	- Each device has a unique IP Address

- IP: Internet Protocol	
	- Devices communicat via thies IP addresses

	Example of and IP 172.16.0.0  
	- contains 4 octets separated by dots. 
	- First  octet 172 =  10101100
	- Second octet  16 =  00010000
	- 3th    octet   0 =  00000000
	- 4th    octet   0 =  00000000	
	- the 4 octets are a 32 bit value
	- Each octet is a Byte, 1 Byte equals to 8 bits
	- 1 bit equal to 1 or 0 
	- the value 00000000 => 0
	- the value 11111111 => 255
	- The IP addresses can range from 0.0.0.0  to  255.255.255.255

- Switch
	- Switch is a device that sits within the LAN
	- Facilitates the connection between all the devices within th LAN

- Router
	- Router is a device that sits between LAN and outside newtork (WAN)
	- This router help tha some LAN device "talk" with others outside devices
	- WAN is Wide Area Network
	- Connects divece on LAN and WAN
	- Allows networked devices to access the internet
	- Gatewqy is the IP address of router
	- Router and Network Gateway are basically the same thing.


### 16.2 Subnet

- How to know , whether the other device is inside or outside the LAN ?
- It knows because of IP address of target device
- Devices in the LAN belogn to same IP address range
- Subnet : logical subdivision of an IP newtwork
- Subnetting : Process of dividig a network into tow or more networks
- Example of IP address range:
		192.168.0.0  255.255.255.0

		- IP address (192.168.0.0): starting point of IP range, the first IP in the range.
		- Subnet Mask: Sets the IP range, example
			- if subnet mask is 255.255.0.0 ,all IP address starting with 192.168.x.x belongs to same LAN.
			- If subnet mask is 255.255.255.0 , all IP address starting with 192.168.0.x belongs to same LAN 
			- 255.255.0.0   : means that 16 bits are fixed (the 2 first octets)
			- 255.255.255.0 : means that 24 bits are fixed
			- value 255 fixates the octet
			- value   0 means free range.


### 16.3 CIDR Block

- Subnet Mask dictates how many bits are fixed
- 255.255.0.0   : means that 16 bits are fixed
- 255.255.255.0 : means that 24 bits are fixed 
- CIDR  : Classless Inter-Domain Routing,  CIDR for shorthand
- 192.168.0.0/16 means 16 bits are fixed
- 192.168.0.0/24 means 25 bits are fixed


### 16.4 Recap
- ANy device needs 3 pieces of data for communication:
	- IP Address
	- Subnet
	- Gatway


### 16.5 Network Access Translation (NAT)

- How to make sure the IP addresses don't overlap?
- IP address within LAN are not visible to the outside network or internet
- Your Laptop's privater IP address is replaced by the router
- Network Address Translation, the NAT ies key functionality of a router
- Benefits fo NAT:
	- Security and protection of devices within LAN
	- Reuse IP addresses
	- Limited number of IPv4 addresses available: 4,294,967,296 public addresses


### 16.6 Firewall

- By default, the server is not accessible from outside the LAN
- A system that prevents unauthorized access from entering a private network
- Using Firewall Rules you can define, which requests are allowed
- Firewall Rules:
	- Which IP address in you network is accessible
	- which IP address can access your server
	- You can e.g. allow any divice access your server


### 16.7 Ports

- Every device has a set of ports
- You can allow specific ports (doors)
- You can allow specific ports (doors) AND spefific IP address (guess)
- Firewall Rule: e.g.   allow port 80 only for the IP 127.22.30.1
- Different application listen on specific ports
- Standar ports for many applications
	- Web Servers port 80
	- MySQL DB  port 3306
	- PostgresQL DB  5432
- For every application you need a port!
- Each port is unique on a device
- Port Forwarding: Is the configuration that allows device IP address at port to be accessed

### 16.8 Domain Name System (DNS)

- Domain Name Service (DNS) : Translates domain names to IP addresses
- Domain Names have a hierarchical structure
- Root domains .
- Top Level Domains  
	- .mil  : military
	- .edu  : educational
	- .com  :
	- .org  : 
	- .net  : networking technologies
	- .gov

- Internet Corporation for Assigned Names and Numbers (ICANN)
	- Manages the TLD development and architecture of the internet domain space
	- Auhorizes Domain Name Registres, which register and assign doman names
	- Subdomain
		- root .
		- top level domain name   .com
								  techworld-with-nana
		- subdomain               bootcamp, workshops , courses						   

	- Fully Qualified Domain Name
		- courses.techworld-with-nana.com.  (the dot at the end is the root domain)
		- root domain is not necessary to specify the dot at the end


- How does DNS Resolution work ?
- Every computer has a DNS Client that sends a request to the resolver (usuarlly your internet provider)
- the provider (resolver) finds in its cache, if not requests for top level domains,
- that servers places around the world
- Top Level Domain (TDL) server
- TLD stores the address information for top level domains


### 16.9 Networking Commands

- ifconfig
- netstat
- ps aux
- nslookup
- ping