function Problem09_Primes
% Problem 9: Prime Numbers in a Range
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Prime Numbers in a Range', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 9: Prime Numbers in a Range','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Lower');label1.Layout.Row=1;label1.Layout.Column=1;
lower=uieditfield(layout,'text','Value','10');
lower.Layout.Row=1;lower.Layout.Column=2;
label2=uilabel(layout,'Text','Upper');label2.Layout.Row=2;label2.Layout.Column=1;
upper=uieditfield(layout,'text','Value','30');
upper.Layout.Row=2;upper.Layout.Column=2;
button1=uibutton(layout,'push','Text','Find Primes','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
[ok,v]=numbers(lower,upper);if ~ok,return;end
if any(v~=fix(v)),show('Whole numbers required',false);return;end
lo=max(2,min(v));hi=max(v);
if hi-lo>100000,show('Range too large',false);return;end
r=lo:hi;r=r(arrayfun(@isprime,r));
if isempty(r),s='None';else,s=strtrim(sprintf('%d ',r));end
show(sprintf('%s (Count = %d)',s,numel(r)));
end
end
