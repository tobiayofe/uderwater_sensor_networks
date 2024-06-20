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

% obtain PFN vectors for each node, bet it SN, UWSN, or nodes
all_nodes = [sinkNodeObjArray; underwaterSinkNodeObjArray; nodeObjArray];

for i=1:length(all_nodes)
    nodesExcludeSrcArr = all_nodes;
    nodesExcludeSrcArr(i).coord(3)=-Inf;
    all_nodes(i).pfn = pfn_sn(all_nodes(i).coord(3),nodesExcludeSrcArr);
    all_nodes(i).pfn_num = all_nodes(i).vector_count(all_nodes(i).pfn);
end

for a_nodes = 1:length(all_nodes) % all nodes - a_node
    detected_nodes_id = zeros(1,111);
    for  nodes= 1:length(all_nodes(a_nodes).pfn) % nodes only
        Dk=0;
        
        if  all_nodes(a_nodes).pfn(nodes)~=-Inf && ... 
            all_nodes(a_nodes).id ~= all_nodes(nodes).id
            node_x = [all_nodes(nodes).coord(1), all_nodes(a_nodes).coord(1)];
            node_y = [all_nodes(nodes).coord(2), all_nodes(a_nodes).coord(2)];
            node_z = [all_nodes(nodes).coord(3), all_nodes(a_nodes).coord(3)];
            Dk = euclidean_distance(node_x, node_y, node_z);
            
            if Dk <= 2 % node_t_range
                detected_nodes_id(1,nodes) = nodes;
            else
                detected_nodes_id(1,nodes) = -Inf;
            end
        end
    end
    all_nodes(a_nodes).nodes_in_range = detected_nodes_id;
end

% Count the number of nodes in range for each nodes
for i=1:length(all_nodes)
    all_nodes(i).nodes_in_range_count = all_nodes(i).vector_count(all_nodes(i).nodes_in_range);
    %nodeObjArray(i).pfn_num = nodeObjArray(i).vector_count(nodeObjArray(i).pfn);
    %nodeObjArray(i).pfn_num = nodeObjArray.pfn_count(nodeObjArray(i).pfn);
end

% Next line of actions
% Write code to select a node of interest
% Write code to simulates transmission of data from source node to destination
% Write code simulate transmission of data
% Write code 