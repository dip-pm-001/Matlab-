function Problem18_Cinema
% Problem 18: Cinema Ticket Booking
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Cinema Ticket Booking', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 18: Cinema Ticket Booking','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Seat Type');label1.Layout.Row=1;label1.Layout.Column=1;
seat=uidropdown(layout,'Items',{'Silver','Gold','Platinum'});seat.Value='Gold';
seat.Layout.Row=1;seat.Layout.Column=2;
label2=uilabel(layout,'Text','Tickets');label2.Layout.Row=2;label2.Layout.Column=1;
tickets=uidropdown(layout,'Items',{'1','2','3','4','5','6','7','8','9','10'});tickets.Value='4';
tickets.Layout.Row=2;tickets.Layout.Column=2;
button1=uibutton(layout,'push','Text','Book','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
switch seat.Value
case 'Silver',price=150;case 'Gold',price=250;case 'Platinum',price=400;
end
n=str2double(tickets.Value);subtotal=n*price;
if n>=4,disc=.1*subtotal;else,disc=0;end
show(sprintf('%d x Rs.%g = Rs.%.2f (Discount Rs.%.2f) -> Rs.%.2f',n,price,subtotal,disc,subtotal-disc));
end
end
