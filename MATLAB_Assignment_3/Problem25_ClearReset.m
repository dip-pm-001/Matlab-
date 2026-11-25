function Problem25_ClearReset
% Problem 25: Clear and Reset
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Clear and Reset', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 25: Clear and Reset','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[7 2]); layout.RowHeight = repmat({32},1,7); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Edit: 1st No');label1.Layout.Row=1;label1.Layout.Column=1;
a=uieditfield(layout,'text','Value','15');
a.Layout.Row=1;a.Layout.Column=2;
label2=uilabel(layout,'Text','Edit: 2nd No');label2.Layout.Row=2;label2.Layout.Column=1;
b=uieditfield(layout,'text','Value','25');
b.Layout.Row=2;b.Layout.Column=2;
label3=uilabel(layout,'Text','Dropdown: 1st No');label3.Layout.Row=3;label3.Layout.Column=1;
c=uidropdown(layout,'Items',{'0','5','10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85','90','95','100'});c.Value='30';
c.Layout.Row=3;c.Layout.Column=2;
label4=uilabel(layout,'Text','Dropdown: 2nd No');label4.Layout.Row=4;label4.Layout.Column=1;
d=uidropdown(layout,'Items',{'0','5','10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85','90','95','100'});d.Value='20';
d.Layout.Row=4;d.Layout.Column=2;
button1=uibutton(layout,'push','Text','Sum','ButtonPushedFcn',@(src,event) editSum());button1.Layout.Row=5;button1.Layout.Column=2;
button2=uibutton(layout,'push','Text','ADD','ButtonPushedFcn',@(src,event) dropSum());button2.Layout.Row=6;button2.Layout.Column=2;
button3=uibutton(layout,'push','Text','CLEAR','ButtonPushedFcn',@(src,event) clearAll());button3.Layout.Row=7;button3.Layout.Column=2;
a.Value='';b.Value='';c.Value=c.Items{1};d.Value=d.Items{1};show('Sum');
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
function editSum()
[ok,v]=numbers(a,b);if ok,show(sprintf('Addition is : %g',sum(v)));end
end
function dropSum()
show(sprintf('After Dropdown Selection : %g',str2double(c.Value)+str2double(d.Value)));
end
function clearAll()
a.Value='';b.Value='';c.Value=c.Items{1};d.Value=d.Items{1};show('Sum');
end
end
