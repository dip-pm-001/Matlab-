function Problem12_Operations
% Problem 12: Operation Selector
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Operation Selector', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 12: Operation Selector','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','1st No');label1.Layout.Row=1;label1.Layout.Column=1;
a=uidropdown(layout,'Items',{'0','5','10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85','90','95','100'});a.Value='40';
a.Layout.Row=1;a.Layout.Column=2;
label2=uilabel(layout,'Text','Operation');label2.Layout.Row=2;label2.Layout.Column=1;
op=uidropdown(layout,'Items',{'Add','Subtract','Multiply','Divide','Modulus'});op.Value='Divide';
op.Layout.Row=2;op.Layout.Column=2;
label3=uilabel(layout,'Text','2nd No');label3.Layout.Row=3;label3.Layout.Column=1;
b=uidropdown(layout,'Items',{'0','5','10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85','90','95','100'});b.Value='5';
b.Layout.Row=3;b.Layout.Column=2;
button1=uibutton(layout,'push','Text','Compute','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=4;button1.Layout.Column=2;
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
x=str2double(a.Value);y=str2double(b.Value);
switch op.Value
case 'Add',r=x+y;symbol='+';
case 'Subtract',r=x-y;symbol='-';
case 'Multiply',r=x*y;symbol='*';
case 'Divide'
if y==0,show('Division by zero not allowed',false);return;end
r=x/y;symbol='/';
case 'Modulus'
if y==0,show('Modulus by zero not allowed',false);return;end
r=mod(x,y);symbol='mod';
end
show(sprintf('%g %s %g = %g',x,symbol,y,r));
end
end
