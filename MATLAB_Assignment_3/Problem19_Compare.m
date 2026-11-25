function Problem19_Compare
% Problem 19: Compare Two Selections
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Compare Two Selections', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 19: Compare Two Selections','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','1st No');label1.Layout.Row=1;label1.Layout.Column=1;
a=uidropdown(layout,'Items',{'5','10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85','90','95','100'});a.Value='70';
a.Layout.Row=1;a.Layout.Column=2;
label2=uilabel(layout,'Text','2nd No');label2.Layout.Row=2;label2.Layout.Column=1;
b=uidropdown(layout,'Items',{'5','10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85','90','95','100'});b.Value='45';
b.Layout.Row=2;b.Layout.Column=2;
button1=uibutton(layout,'push','Text','Compare','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
if x==y,show('Both are equal');out.FontColor=[0 .5 0];
elseif x>y,show(sprintf('1st No is greater by %g',x-y));out.FontColor=[0 0 1];
else,show(sprintf('2nd No is greater by %g',y-x));out.FontColor=[1 .45 0];end
end
end
