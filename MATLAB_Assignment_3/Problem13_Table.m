function Problem13_Table
% Problem 13: Multiplication Table Generator
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Multiplication Table Generator', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 13: Multiplication Table Generator','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Number');label1.Layout.Row=1;label1.Layout.Column=1;
num=uidropdown(layout,'Items',{'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'});num.Value='7';
num.Layout.Row=1;num.Layout.Column=2;
label2=uilabel(layout,'Text','Up to');label2.Layout.Row=2;label2.Layout.Column=1;
upto=uidropdown(layout,'Items',{'5','10','15','20'});upto.Value='10';
upto.Layout.Row=2;upto.Layout.Column=2;
button1=uibutton(layout,'push','Text','Generate','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
n=str2double(num.Value);limit=str2double(upto.Value);
rows=cell(limit,1);
for i=1:limit,rows{i}=sprintf('%g x %g = %g',n,i,n*i);end
show(string(rows));
end
end
