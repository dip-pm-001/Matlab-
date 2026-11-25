function Problem06_Largest
% Problem 6: Largest of Three Numbers
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Largest of Three Numbers', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 6: Largest of Three Numbers','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','1st No');label1.Layout.Row=1;label1.Layout.Column=1;
a=uieditfield(layout,'text','Value','34');
a.Layout.Row=1;a.Layout.Column=2;
label2=uilabel(layout,'Text','2nd No');label2.Layout.Row=2;label2.Layout.Column=1;
b=uieditfield(layout,'text','Value','78');
b.Layout.Row=2;b.Layout.Column=2;
label3=uilabel(layout,'Text','3rd No');label3.Layout.Row=3;label3.Layout.Column=1;
c=uieditfield(layout,'text','Value','51');
c.Layout.Row=3;c.Layout.Column=2;
button1=uibutton(layout,'push','Text','Find Max','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=4;button1.Layout.Column=2;
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
[ok,v]=numbers(a,b,c);if ~ok,return;end
names={'1st No','2nd No','3rd No'};m=max(v);
show(sprintf('Largest is %g (%s)',m,strjoin(names(v==m),', ')));
end
end
