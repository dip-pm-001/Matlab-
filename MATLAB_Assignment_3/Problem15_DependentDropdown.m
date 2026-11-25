function Problem15_DependentDropdown
% Problem 15: Dependent Drop Downs
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Dependent Drop Downs', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 15: Dependent Drop Downs','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Department');label1.Layout.Row=1;label1.Layout.Column=1;
dept=uidropdown(layout,'Items',{'CSE','ECE','ME'});dept.Value='CSE';
dept.Layout.Row=1;dept.Layout.Column=2;
label2=uilabel(layout,'Text','Subject');label2.Layout.Row=2;label2.Layout.Column=1;
subject=uidropdown(layout,'Items',{'DBMS','OS','CN'});subject.Value='DBMS';
subject.Layout.Row=2;subject.Layout.Column=2;
button1=uibutton(layout,'push','Text','Show','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
dept.ValueChangedFcn=@(src,event) changed();
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
function changed()
switch dept.Value
case 'CSE',subject.Items={'DBMS','OS','CN'};
case 'ECE',subject.Items={'Signals','Digital Electronics','Communication'};
case 'ME',subject.Items={'Thermodynamics','Mechanics','Manufacturing'};
end
subject.Value=subject.Items{1};
end
function calc()
show(sprintf('%s -> %s selected',dept.Value,subject.Value));
end
end
