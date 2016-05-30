class VisitorsController < ApplicationController

	require 'socket'
	 
	
	 
	 def index
	 	@ip = local_ip	
	 end
	 
	 
	 def get_ip
	 	
	 	addr_infos = Socket.ip_address_list
	 	
	 	addr_infos.each do |addr_info|
  			puts addr_info.ip_address
		end
		
		
	 end
	 
	 
	 def local_ip
  		orig = Socket.do_not_reverse_lookup  
  		Socket.do_not_reverse_lookup =true # turn off reverse DNS resolution temporarily
  		UDPSocket.open do |s|
    	s.connect '64.233.187.99', 1 #google
    	s.addr.last
  	end
		ensure
  		Socket.do_not_reverse_lookup = orig
	end

	 

	def my_first_private_ipv4
  		Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
	end

	def my_first_public_ipv4
  		Socket.ip_address_list.detect{|intf| intf.ipv4? and !intf.ipv4_loopback? and !intf.ipv4_multicast? and !intf.ipv4_private?}
	end
	
	
end
