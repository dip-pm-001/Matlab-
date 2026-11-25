function Problem14_Power
% Problem 14: Power Calculator
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Power Calculator', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 14: Power Calculator','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Base');label1.Layout.Row=1;label1.Layout.Column=1;
base=uidropdown(layout,'Items',{'1','2','3','4','5','6','7','8','9','10'});base.Value='2';
base.Layout.Row=1;base.Layout.Column=2;
label2=uilabel(layout,'Text','Exponent');label2.Layout.Row=2;label2.Layout.Column=1;
exponent=uidropdown(layout,'Items',{'0','1','2','3','4','5','6','7','8','9','10'});exponent.Value='10';
exponent.Layout.Row=2;exponent.Layout.Column=2;
button1=uibutton(layout,'push','Text','Calculate','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
b=str2double(base.Value);e=str2double(exponent.Value);v=b^e;
if mod(v,2)==0,p='Even';else,p='Odd';end
show(sprintf('%g ^ %g = %.0f (%s)',b,e,v,p));
end
end
