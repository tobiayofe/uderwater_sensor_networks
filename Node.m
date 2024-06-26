classdef Node
    properties
        id; coord;
        t_energy; % Node's initial energy
        k=1; residual_energy; pfn=[];
        pfn_num; nodes_in_range=[]; nodes_in_range_count;
        data_snt = []; data_rcv = [];
  
    end
    
    methods
        function obj = Node()
            % obj.pfn_num = obj.pfn_count();
        end
        function [euclid] = node2sink_distance(x,y,z)
            euclid = euclidean_distance(x,y,z);
        end
        
        function [pfn] = pfn_select(nodes_depths)
            pfn = pfn_sn(nodes_depths);
        end
        
        function [vect_num] = vector_count(~,vect)
            counter=0;
            l = vect;
            for i=1:length(l)
                if l(i)>0
                    counter=counter+1;
                end
            end
            vect_num = counter;
        end
        
        %function send = transmit(~,data, app_port_num,dstIP,dstMac)
        function send = transmit(~,data, app_port_num,dstMac)
            srcIP = ip_address(); srcMac = obj.id;
            if data=="broadcast_proto"
                proto_type = "UDP";
                encapsulation = Proto(proto_type);
                send = encapsulation.encapsulation_broadcast();
            else
                proto_type = "TCP";
                encapsulation = Proto(proto_type);
                % segment_size = 20; % Bytes % To be considered later
                % send = encapsulation.encapsulation(data,segment_size,app_port_num,srcIP,dstIP,srcMac,dstMac);
                % The send variable arguments would be considered later.
                
                send = encapsulation.encapsulation(data,app_port_num,obj.id,dstMac);
            end
            
            function [receiver] = rcv_data(obj)
                receiver = [];
            end
            
            function ip_addr = ip_address(~)
                ip_addr = "192.168.1."+obj.id;
            end

        end
    end
end