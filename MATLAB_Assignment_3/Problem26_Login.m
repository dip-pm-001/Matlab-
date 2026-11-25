function Problem26_Login
% Problem 26: Simple Login Screen
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Simple Login Screen', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 26: Simple Login Screen','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Username');label1.Layout.Row=1;label1.Layout.Column=1;
username=uieditfield(layout,'text','Value','admin');
username.Layout.Row=1;username.Layout.Column=2;
label2=uilabel(layout,'Text','Password');label2.Layout.Row=2;label2.Layout.Column=1;
password=uieditfield(layout,'text','Value','admin@1');
password.Layout.Row=2;password.Layout.Column=2;
label3=uilabel(layout,'Text','Role');label3.Layout.Row=3;label3.Layout.Column=1;
role=uidropdown(layout,'Items',{'Faculty','Student','Admin'});role.Value='Faculty';
role.Layout.Row=3;role.Layout.Column=2;
button1=uibutton(layout,'push','Text','Login','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=4;button1.Layout.Column=2;
attempts=0;loginButton=button1;
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
u=string(username.Value);p=string(password.Value);r=string(role.Value);
valid=(u=="admin"&&p=="admin@1"&&r=="Faculty")||...
(u=="student"&&p=="student@1"&&r=="Student")||...
(u=="manager"&&p=="manager@1"&&r=="Admin");
if valid,attempts=0;show("Login Successful - Welcome "+r);
else
attempts=attempts+1;
if attempts>=3,loginButton.Enable='off';show('Invalid Credentials - Login disabled after 3 attempts',false);
else,show(sprintf('Invalid Credentials (%d attempts left)',3-attempts),false);end
end
end
end
