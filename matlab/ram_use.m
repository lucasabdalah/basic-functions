classdef ram_use
%ram_use.m - Description
%
% Class: memory_use
%
% Long description
    
    methods(Static)


        function memory_elem = check_set(X)
        %myFun - Description
        %
        % Syntax: output = myFun(input)
        %

            if isreal(X) == true % Check if it's real
                memory_elem = 8; % bytes
            else
                memory_elem = 16; % bytes
            end

        end
        

        function prefix_bytes = check_bytes(memory)
        %% BYTES_CHECK - Verify the memory use threshold to display a most proper
        % way the amount of bytes. Bytes, KiloBytes, MegaBytes or GigaBytes.
        %
        % Syntax: prefix_bytes = bytes_check(memory) 
        %
            if memory < 1025
                prefix_bytes = sprintf('%2.0f b\n', memory);
            elseif memory < 1024^2+1
                prefix_bytes = sprintf('%2.0f Kb\n', memory/1024);
            elseif memory < 1024^3+1
                prefix_bytes = sprintf('%2.0f Mb\n', memory/1024^2);
            else
                prefix_bytes = sprintf('%2.0f Gb\n', memory/1024^3);
            end

        end
        
        
        function [dim, elements, memory, log_text] = kron_dim(A, B)
        % kron_dim - Verify the memory use of Kronnecker product
        %
        % Syntax: prefix_bytes = bytes_check(memory) 
        %
            memory_elem = max([ram_use.check_set(A), ram_use.check_set(B)]); % Check if the matrix is real or complex

            dim = size(A).*size(B); % get_limit = memory % get_limit.MaxPossibleArrayBytes % 13999538176 bytes
            elements = prod(dim(:));
            memory = (memory_elem*elements);

            prefix_bytes = ram_use.check_bytes(memory);
            
            log_text = sprintf("Matrix Dimensions: %dX%d \nN of elements: %d \nMemory use: %s \n", ...
                dim(1), dim(2), elements, prefix_bytes);
            
            fprintf(log_text);
        end


    end

end