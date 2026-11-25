function Problem22_Electricity
% Problem 22: Electricity Bill Calculator
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Electricity Bill Calculator', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 22: Electricity Bill Calculator','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Units');label1.Layout.Row=1;label1.Layout.Column=1;
units=uieditfield(layout,'text','Value','250');
units.Layout.Row=1;units.Layout.Column=2;
label2=uilabel(layout,'Text','Connection');label2.Layout.Row=2;label2.Layout.Column=1;
connection=uidropdown(layout,'Items',{'Domestic','Commercial'});connection.Value='Domestic';
connection.Layout.Row=2;connection.Layout.Column=2;
button1=uibutton(layout,'push','Text','Calculate Bill','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
[ok,v]=numbers(units);if ~ok,return;end
if v<0,show('Units must be non-negative',false);return;end
bill=min(v,100)*5+max(0,min(v-100,100))*7+max(0,v-200)*9;
if strcmp(connection.Value,'Commercial'),bill=bill*1.5;end
show(sprintf('Bill Amount : Rs.%.2f',bill));
end
end
