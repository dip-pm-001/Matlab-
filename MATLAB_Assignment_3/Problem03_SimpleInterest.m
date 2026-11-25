function Problem03_SimpleInterest
% Problem 3: Simple Interest Calculator
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Simple Interest Calculator', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 3: Simple Interest Calculator','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Principal');label1.Layout.Row=1;label1.Layout.Column=1;
p=uieditfield(layout,'text','Value','10000');
p.Layout.Row=1;p.Layout.Column=2;
label2=uilabel(layout,'Text','Rate (%)');label2.Layout.Row=2;label2.Layout.Column=1;
r=uieditfield(layout,'text','Value','8');
r.Layout.Row=2;r.Layout.Column=2;
label3=uilabel(layout,'Text','Time (years)');label3.Layout.Row=3;label3.Layout.Column=1;
t=uieditfield(layout,'text','Value','3');
t.Layout.Row=3;t.Layout.Column=2;
button1=uibutton(layout,'push','Text','Calculate','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=4;button1.Layout.Column=2;
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
[ok,v]=numbers(p,r,t);if ~ok,return;end
if any(v<0),show('Inputs must be non-negative',false);return;end
si=prod(v)/100;show(sprintf('Interest : %.2f\nAmount : %.2f',si,v(1)+si));
end
end
