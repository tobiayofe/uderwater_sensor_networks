function [all_nodes] = node_configurator()
% Create nodes objects
nodeCount=100;
nodeObjArray(nodeCount,1) = Node();
%nodeObjArray = zeros(nodeCount:1);
nodeObjArray=createNodeObj(nodeCount,"NNNN",nodeObjArray,8000);

% Create surface sink nodes objects
surface_sinks=9;
sinkNodeObjArray(surface_sinks,1)=Node();
sinkNodeObjArray=createNodeObj(surface_sinks,"SSNN",sinkNodeObjArray,10000);

%Create underwater sink nodes objects
underwater_sinks=2;
underwaterSinkNodeObjArray(underwater_sinks,1)=Node();
underwaterSinkNodeObjArray=createNodeObj(underwater_sinks,"UWSN",underwaterSinkNodeObjArray,6000);

% obtain PFN vectors for each node, bet it SN, UWSN, or nodes
all_nodes = [sinkNodeObjArray; underwaterSinkNodeObjArray; nodeObjArray];
end