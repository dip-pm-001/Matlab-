function Problem01_Calculator
% Problem 1: Four-Function Calculator
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Four-Function Calculator', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 1: Four-Function Calculator','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[6 2]); layout.RowHeight = repmat({32},1,6); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','1st No');label1.Layout.Row=1;label1.Layout.Column=1;
a=uieditfield(layout,'text','Value','20');
a.Layout.Row=1;a.Layout.Column=2;
label2=uilabel(layout,'Text','2nd No');label2.Layout.Row=2;label2.Layout.Column=1;
b=uieditfield(layout,'text','Value','4');
b.Layout.Row=2;b.Layout.Column=2;
button1=uibutton(layout,'push','Text','Sum','ButtonPushedFcn',@(src,event) calc('sum'));button1.Layout.Row=3;button1.Layout.Column=2;
button2=uibutton(layout,'push','Text','Difference','ButtonPushedFcn',@(src,event) calc('difference'));button2.Layout.Row=4;button2.Layout.Column=2;
button3=uibutton(layout,'push','Text','Product','ButtonPushedFcn',@(src,event) calc('product'));button3.Layout.Row=5;button3.Layout.Column=2;
button4=uibutton(layout,'push','Text','Quotient','ButtonPushedFcn',@(src,event) calc('quotient'));button4.Layout.Row=6;button4.Layout.Column=2;
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
function calc(op)
[ok,v]=numbers(a,b);if ~ok,return;end
x=v(1);y=v(2);
switch op
case 'sum',r=x+y;
case 'difference',r=x-y;
case 'product',r=x*y;
case 'quotient'
if y==0,show('Division by zero not allowed',false);return;end
r=x/y;
end
show(sprintf('Result: %g',r));
end
end
