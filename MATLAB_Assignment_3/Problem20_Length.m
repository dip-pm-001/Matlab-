function Problem20_Length
% Problem 20: Unit Converter (Length)
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Unit Converter (Length)', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 20: Unit Converter (Length)','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Value');label1.Layout.Row=1;label1.Layout.Column=1;
value=uieditfield(layout,'text','Value','2.5');
value.Layout.Row=1;value.Layout.Column=2;
label2=uilabel(layout,'Text','From');label2.Layout.Row=2;label2.Layout.Column=1;
fromUnit=uidropdown(layout,'Items',{'mm','cm','m','km'});fromUnit.Value='km';
fromUnit.Layout.Row=2;fromUnit.Layout.Column=2;
label3=uilabel(layout,'Text','To');label3.Layout.Row=3;label3.Layout.Column=1;
toUnit=uidropdown(layout,'Items',{'mm','cm','m','km'});toUnit.Value='m';
toUnit.Layout.Row=3;toUnit.Layout.Column=2;
button1=uibutton(layout,'push','Text','Convert','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=4;button1.Layout.Column=2;
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
function calc()
[ok,v]=numbers(value);if ~ok,return;end
units={'mm','cm','m','km'};factor=[.001,.01,1,1000];
a=factor(strcmp(units,fromUnit.Value));b=factor(strcmp(units,toUnit.Value));
show(sprintf('%g %s = %g %s',v,fromUnit.Value,v*a/b,toUnit.Value));
end
end
