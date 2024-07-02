function [pfn] = node_transaction(all_nodes,node_select,query_type)
if node_select.node.nodes_in_range_count >= 1
    disp("Node "+node_select.node_number+" has "+...
        node_select.node.nodes_in_range_count+" node(s) in its range");
    neighbour=1;
    node_id = node_select.node.nodes_in_range(neighbour);
    pfn = all_nodes(node_id); % Potential forwarding node
    neighbour_length = length(node_select.node.nodes_in_range);
    while neighbour <= neighbour_length
        if ( startsWith( all_nodes(node_id).id, "SSNN" ) ...
            || startsWith( all_nodes(node_id).id, "UWSN" ) )
            pfn = all_nodes(node_id);
            break;
        end
        try
            switch lower(query_type)
                case "depth"
                    if pfn.coord(3) > all_nodes(node_select.node.nodes_in_range(neighbour+1)).coord(3)
                        next_node_id = node_select.node.nodes_in_range(neighbour+1);
                        pfn = all_nodes(next_node_id);
                    else
                        % Do nothing
                    end
                case "neighbour"
                    if pfn.nodes_in_range_count < all_nodes(node_select.node.nodes_in_range(neighbour+1)).nodes_in_range_count
                        next_node_id = node_select.node.nodes_in_range(neighbour+1);
                        pfn = all_nodes(next_node_id);
                    else
                         % Do nothing
                     end
            end
        catch ERR
            disp("Task completed");
            break;
        end
        try
            neighbour = neighbour + 1;
        catch ERR
            disp(ERR.message);
            disp("The selected PFN for node"+node_select.node_number+...
                " is detailed as follows:");
            disp("PFN id: " + pfn.id);
            disp("PFN IP address: "+pfn.ip_addr);
            disp("PFN depth:"+pfn.coord(3));
        end
    end
    data = "broadcast"; app_port_num = 1;
    node_select.node.transmit(data,app_port_num,pfn);
% elseif node_select.node.nodes_in_range_count == 1
%     node_id = node_select.node.nodes_in_range;
%     pfn = all_nodes(node_id);
else
    disp("No neighbour detected for node");
end
end

