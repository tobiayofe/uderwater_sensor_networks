function [] = node_query(nodes,queror,criteria)
    for i=1:length(nodes)
        if queror == "pfn"
            if all_nodes(i).coord(3)==criteria
                disp("Node" + i + " PFN : " + nodes(i).pfn_num);
            end
        end
        
        if queror == "range"
            disp("Node" + i + " has " + nodes(i).nodes_in_range_count + " in range");
        end
    end
end

