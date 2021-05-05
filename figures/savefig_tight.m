function savefig_tight(h,outfilename)
%SAVEFIG_TIGHT exports narrow margin figure as PDF file.
%   SAVEFIG_TIGHT(h, outfilename) generates a PDF file from a figure h with
%   a string outfilename. 
%
% INPUTS: 
%       h : figure
%       outfilename : a string to name the exported PDF file
%
% OUTPUTS:
%       none
%
% EXAMPLE:
%       h = figure;
%       plot(1:10,1:10);
%       axis tight;
%       savefig_tight(h,'myfigure');
%
%   See also figure, print.
% 
%HISTORY:
% 2021/05/03 - Lucas Abdalah.
    set(h,'Units','Inches');
    pos = get(h,'Position');
    set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
    print(outfilename ,'-dpdf','-fillpage');
end