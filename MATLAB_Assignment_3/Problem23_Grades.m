function Problem23_Grades
% Problem 23: Marks to Grade
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Marks to Grade', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 23: Marks to Grade','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Marks');label1.Layout.Row=1;label1.Layout.Column=1;
marks=uieditfield(layout,'text','Value','42');
marks.Layout.Row=1;marks.Layout.Column=2;
label2=uilabel(layout,'Text','Out of');label2.Layout.Row=2;label2.Layout.Column=1;
total=uidropdown(layout,'Items',{'50','100'});total.Value='50';
total.Layout.Row=2;total.Layout.Column=2;
label3=uilabel(layout,'Text','Scheme');label3.Layout.Row=3;label3.Layout.Column=1;
scheme=uidropdown(layout,'Items',{'Percentage','CGPA'});scheme.Value='CGPA';
scheme.Layout.Row=3;scheme.Layout.Column=2;
button1=uibutton(layout,'push','Text','Evaluate','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=4;button1.Layout.Column=2;
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
[ok,v]=numbers(marks);if ~ok,return;end
t=str2double(total.Value);
if v<0||v>t,show('Marks must be between 0 and total',false);return;end
pct=v/t*100;
if pct>=90,g='O';elseif pct>=80,g='E';elseif pct>=70,g='A';elseif pct>=60,g='B';elseif pct>=50,g='C';else,g='F';end
if strcmp(scheme.Value,'CGPA'),show(sprintf('%.2f%% -> CGPA %.2f, Grade %s',pct,pct/10,g));
else,show(sprintf('Percentage %.2f%%, Grade %s',pct,g));end
end
end
