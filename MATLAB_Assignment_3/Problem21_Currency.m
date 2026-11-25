function Problem21_Currency
% Problem 21: Currency Converter
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Currency Converter', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 21: Currency Converter','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[3 2]); layout.RowHeight = repmat({32},1,3); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Amount (Rs.)');label1.Layout.Row=1;label1.Layout.Column=1;
amount=uieditfield(layout,'text','Value','8500');
amount.Layout.Row=1;amount.Layout.Column=2;
label2=uilabel(layout,'Text','To');label2.Layout.Row=2;label2.Layout.Column=1;
currency=uidropdown(layout,'Items',{'USD','EUR','GBP','JPY'});currency.Value='USD';
currency.Layout.Row=2;currency.Layout.Column=2;
button1=uibutton(layout,'push','Text','Convert','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=3;button1.Layout.Column=2;
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
[ok,v]=numbers(amount);if ~ok,return;end
if v<0,show('Amount must be non-negative',false);return;end
codes={'USD','EUR','GBP','JPY'};rupeesPerUnit=[85,92,108,.58]; % fixed examples, not live
rate=rupeesPerUnit(strcmp(codes,currency.Value));
show(sprintf('Rs.%.2f = %.2f %s',v,v/rate,currency.Value));
end
end
