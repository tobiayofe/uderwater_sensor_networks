clc; clear;
% Initialising base paper parameters
node_t_range=2;%km
t_energy=20; % Node initial energy
total_net_area=[10, 10, 10];%x=10km, y=10km, z=10km
transmission_power=50;%In Watts(W)
receive_power=158e-6;
frequency=12;%KHz
bandwidth=4;%KHz
signal_prop_speed=1500;%signal propagation speed = 1500m/s
rand_walk=2;%random walk = 2m/s
node_left_mov_prob=0.5;%Probability of node moving to the left
node_right_mov_prob=1-node_left_mov_prob;%Probability of node moving to the right
ack_packet_size=50;%Acknowledgement packet size in bits
n_req_size=50;% Size of N_request
data_rate=16;%Data size rate in Kilo bits per seconds (Kbps)
data_payload_size=72;%In Bytes
data_header_size=11;%In Bytes
max_pow_trans=90;%Maximum transmission power in dB
min_power_recv=10;%Minimum reception power in dB

% Create nodes objects
nodeCount=100;
nodeObjArray(nodeCount,1) = Node();
%nodeObjArray = zeros(nodeCount:1);
nodeObjArray=createNodeObj(nodeCount,"NNNN",nodeObjArray,8);

% Create surface sink nodes objects
surface_sinks=9;
sinkNodeObjArray(surface_sinks,1)=Node();
sinkNodeObjArray=createNodeObj(surface_sinks,"SSNN",sinkNodeObjArray,10);

%Create underwater sink nodes objects
underwater_sinks=2;
underwaterSinkNodeObjArray(underwater_sinks,1)=Node();
underwaterSinkNodeObjArray=createNodeObj(underwater_sinks,"UWSN",underwaterSinkNodeObjArray,6);

% obtain PFN vectors for each node
for i=1:length(nodeObjArray)
    nodesExcludeSrcArr = nodeObjArray;
    nodesExcludeSrcArr(i).coord(3)=-Inf;
    nodeObjArray(i).pfn = pfn_sn(nodeObjArray(i).coord(3),nodesExcludeSrcArr);
    nodeObjArray(i).pfn_num = nodeObjArray(i).vector_count(nodeObjArray(i).pfn);
end

for n=1:nodeCount
    %bcast_id=num2str(n)+"."+num2str(n);
    %node = Node();
    f=1;
    while (f)
       all_sinks = [sinkNodeObjArray; underwaterSinkNodeObjArray];
        for node_sink=1:( size(all_sinks,1) )
            Dk=0;
            for nodes=1:length(nodeObjArray)
                if nodeObjArray(nodes).pfn(nodes)~=-Inf
                    node_x = nodeObjArray(nodes).coord(1) - all_sinks(node_sink).coord(1);
                    node_y = nodeObjArray(nodes).coord(2) - all_sinks(node_sink).coord(2);
                    node_z = nodeObjArray(nodes).coord(3) - all_sinks(node_sink).coord(3);
                    Dk = euclidean_distance(node_x, node_y, node_z);
                end
                k=1; % Changes values to 1.5 and 2 to observe the effects
                % t_range = transmission_range(); % Or use a pre-defined value set in the node_t_range variable which is equals to 2km
                alpha = 2;
                if Dk < node_t_range
                    t_energy = ( (node_t_range - Dk) / Dk ) * nodeObjArray(nodes).t_energy;
                    disp("Packet delivered successfully");
                    tr_energy = k*(Dk^alpha);
                    nodeObjArray(nodes).t_energy = nodeObjArray(nodes).t_energy - tr_energy;
                    f=0;
                    break;
                end % terminates the if statement euclidean_distance Dk
            end % terminates the for loop nodes
        end % terminates the for loop node_sink
      
    end % terminates the while loop (f)
end