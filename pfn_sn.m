function [pfn] = pfn_sn(source_node_depth, nodesObj)
%pfn_sn is used to obtain both potential forwading nodes and suppressed
%nodes
    clc;
    node_length = length(nodesObj);
    pfn_vect=zeros(1,node_length);
    for i = 1:node_length
        if source_node_depth > nodesObj(i).coord(3) && nodesObj(i).coord(3) ~= -Inf
            pfn_vect(i) = i;
        else
            pfn_vect(i)=-Inf;
        end
    end
    pfn = pfn_vect;
end