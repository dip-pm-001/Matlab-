function Problem11_Strings
% Problem 11: String Operations
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - String Operations', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 11: String Operations','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Enter Word');label1.Layout.Row=1;label1.Layout.Column=1;
word=uieditfield(layout,'text','Value','MATLAB');
word.Layout.Row=1;word.Layout.Column=2;
button1=uibutton(layout,'push','Text','Reverse','ButtonPushedFcn',@(src,event) calc('Reverse'));button1.Layout.Row=2;button1.Layout.Column=2;
button2=uibutton(layout,'push','Text','Vowels','ButtonPushedFcn',@(src,event) calc('Vowels'));button2.Layout.Row=3;button2.Layout.Column=2;
button3=uibutton(layout,'push','Text','Palindrome?','ButtonPushedFcn',@(src,event) calc('Palindrome'));button3.Layout.Row=4;button3.Layout.Column=2;
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
s=char(word.Value);
if isempty(strtrim(s)),show('Enter a word',false);return;end
switch op
case 'Reverse',show(['Reversed : ' fliplr(s)]);
case 'Vowels',show(sprintf('Vowels : %d',sum(ismember(lower(s),'aeiou'))));
case 'Palindrome'
if strcmpi(s,fliplr(s)),show('Palindrome : Yes');else,show('Palindrome : No');end
end
end
end
