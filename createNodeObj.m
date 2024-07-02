function [nodeObjArr] = createNodeObj(nodeCount,bcast_qualifier, nodeObjArrayInit,max_height)
clc;
for node=1:nodeCount
    node_coord= zeros(1,3); %Setting the nodes' x,y,z coordinatesclass
    % bcast_id=[];
    nodeObj = Node();
    for coord=1:3
        node_coord(coord)=floor(rand*max_height)+1;
    end
    bcast_id=bcast_qualifier+":"+num2str(node)+":"+num2str(node);
    nodeObj.id = bcast_id; nodeObj.coord = node_coord;
    nodeObj.t_energy = floor(rand*20)+1;
    % Investigate why the function below is not working
    %nodeObj.ip_address(node);
    nodeObj.ip_addr = "192.168.1."+node;
    nodeObjArrayInit(node) = nodeObj;
end
nodeObjArr=nodeObjArrayInit;
end