function Problem17_Pizza
% Problem 17: Pizza Order Bill
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Pizza Order Bill', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 17: Pizza Order Bill','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Size');label1.Layout.Row=1;label1.Layout.Column=1;
size=uidropdown(layout,'Items',{'Small','Medium','Large'});size.Value='Medium';
size.Layout.Row=1;size.Layout.Column=2;
label2=uilabel(layout,'Text','Quantity');label2.Layout.Row=2;label2.Layout.Column=1;
qty=uidropdown(layout,'Items',{'1','2','3','4','5','6','7','8','9','10'});qty.Value='3';
qty.Layout.Row=2;qty.Layout.Column=2;
button1=uibutton(layout,'push','Text','Generate Bill','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
switch size.Value
case 'Small',price=200;case 'Medium',price=350;case 'Large',price=500;
end
total=price*str2double(qty.Value);gst=total*.05;
show(sprintf('Total Rs.%.2f + GST Rs.%.2f = Rs.%.2f',total,gst,total+gst));
end
end
