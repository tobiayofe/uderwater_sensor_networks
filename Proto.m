classdef Proto
    properties
        proto = "TCP"; % It can be UDP as well
        
        
    end
    
    methods
        function obj = Proto(proto_type)
            obj.proto = proto_type;
            obj = Proto();          
        end
        
        function [encaped] = encapsulation_broadcast(~)
            % This is used for broadcast
            lay1 = ["broadcast", srcMac, dstMac];
            encap.lay1 = lay1;
            encaped = encap;
        end
        
        function [encaped] = encapsulation_data (data,segment_size,app_port_num,srcIP,dstIP,srcMac,dstMac)
            % layer 4 - application layer setup
            sessID = round( rand()*50+1 );
            lay4 = [data,sessID];
            encap.lay4 = lay4;
            % layer 3 - transport layer setup
            srcPort = round( (rand()+6500)*(rand()+0.6) );
            dstPortNum = app_port_num;            
            lay3 = [obj.proto, segment_size, srcPort, dstPortNum];
            encap.lay3 = lay3;
            % layer 2 - Internet layer setup
            lay2 = [srcIP, dstIP];
            encap.lay2 = lay2;
            % layer 1 - Network access layer setup
            lay1 = ["data", srcMac, dstMac];
            encap.lay1 = lay1;
            encaped = encap;
        end
    end
end