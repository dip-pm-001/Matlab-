function Problem08_GcdLcm
% Problem 8: GCD and LCM Finder
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - GCD and LCM Finder', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 8: GCD and LCM Finder','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','1st No');label1.Layout.Row=1;label1.Layout.Column=1;
a=uieditfield(layout,'text','Value','12');
a.Layout.Row=1;a.Layout.Column=2;
label2=uilabel(layout,'Text','2nd No');label2.Layout.Row=2;label2.Layout.Column=1;
b=uieditfield(layout,'text','Value','18');
b.Layout.Row=2;b.Layout.Column=2;
button1=uibutton(layout,'push','Text','GCD','ButtonPushedFcn',@(src,event) calc('GCD'));button1.Layout.Row=3;button1.Layout.Column=2;
button2=uibutton(layout,'push','Text','LCM','ButtonPushedFcn',@(src,event) calc('LCM'));button2.Layout.Row=4;button2.Layout.Column=2;
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
if any(v<1)||any(v~=fix(v)),show('Positive integers required',false);return;end
if strcmp(op,'GCD'),r=gcd(v(1),v(2));else,r=lcm(v(1),v(2));end
show(sprintf('%s of %d and %d is %d',op,v(1),v(2),r));
end
end
