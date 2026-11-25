function Problem04_Temperature
% Problem 4: Temperature Converter
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Temperature Converter', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 4: Temperature Converter','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Temperature');label1.Layout.Row=1;label1.Layout.Column=1;
temp=uieditfield(layout,'text','Value','100');
temp.Layout.Row=1;temp.Layout.Column=2;
button1=uibutton(layout,'push','Text','C -> F','ButtonPushedFcn',@(src,event) calc('C'));button1.Layout.Row=2;button1.Layout.Column=2;
button2=uibutton(layout,'push','Text','F -> C','ButtonPushedFcn',@(src,event) calc('F'));button2.Layout.Row=3;button2.Layout.Column=2;
function show(msg,good)
if nargin<2,good=true;end
out.Value=cellstr(splitlines(string(msg)));
if good,out.FontColor=[0 .45 .12];else,out.FontColor=[.8 .1 .1];end
end
function [ok,v]=numbers(varargin)
v=zeros(1,numel(varargin));ok=false;
for k=1:numel(varargin)
s=strtrim(string(varargin{k}.Value));v(k)=str2double(s);
if strlength(s)==0 || ~isfinite(v(k)),show('Invalid Input - numbers only',false);return;end
end
ok=true;
end
function calc(mode)
[ok,v]=numbers(temp);if ~ok,return;end
if strcmp(mode,'C'),show(sprintf('%g °C = %.2f °F',v,v*9/5+32));
else,show(sprintf('%g °F = %.2f °C',v,(v-32)*5/9));end
end
end
