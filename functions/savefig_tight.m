function savefig_tight(h,outfilename,format)
%
%SAVEFIG_TIGHT exports narrow margin figure as file.
%
%       SAVEFIG_TIGHT(h, outfilename) generates a figure as a specified file format
%       from a figure h with a string outfilename. 
%
%       Inputs: 
%       h : figure
%       outfilename : a string to name the exported file
%       format : File format ('pdf', 'png', 'both')
%
%       Examples:
%           h = figure;
%           plot(1:10,1:10);
%           axis tight;
%           savefig_tight(h,'myfigure','png');
%
%       See also FIGURE, PRINT
% 
%   HISTORY:
%       2021/05/03 - Lucas Abdalah
%       2022/05/17 - Lucas Abdalah
%

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

switch format
    case 'pdf'
        print(outfilename ,'-dpdf','-fillpage');
    case 'png'
        print(outfilename ,'-dpng');
    case 'both'
        print(outfilename ,'-dpdf','-fillpage');
        print(outfilename ,'-dpng');
    otherwise
        error('Error. \nInput unkown. Format variable must be a string containing an available format:\n"pdf"\n"png"')
end

end