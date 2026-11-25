function Problem05_BMI
% Problem 5: BMI Calculator with Category
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - BMI Calculator with Category', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 5: BMI Calculator with Category','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Weight (kg)');label1.Layout.Row=1;label1.Layout.Column=1;
weight=uieditfield(layout,'text','Value','70');
weight.Layout.Row=1;weight.Layout.Column=2;
label2=uilabel(layout,'Text','Height (m)');label2.Layout.Row=2;label2.Layout.Column=1;
height=uieditfield(layout,'text','Value','1.75');
height.Layout.Row=2;height.Layout.Column=2;
button1=uibutton(layout,'push','Text','Compute BMI','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
[ok,v]=numbers(weight,height);if ~ok,return;end
if any(v<=0),show('Weight and height must be positive',false);return;end
bmi=v(1)/v(2)^2;
if bmi<18.5,c='Underweight';elseif bmi<25,c='Normal';elseif bmi<30,c='Overweight';else,c='Obese';end
show(sprintf('BMI : %.2f\nCategory : %s',bmi,c));
end
end
