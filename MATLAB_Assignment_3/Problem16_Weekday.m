function Problem16_Weekday
% Problem 16: Day of the Week Finder
% Standalone GUI with callbacks; execute this function in MATLAB.
fig = uifigure('Name', 'Assignment 3 - Day of the Week Finder', 'Position', [100 100 760 460]);
main = uigridlayout(fig,[3 1]); main.RowHeight = {55,'1x',140};
heading = uilabel(main,'Text','Problem 16: Day of the Week Finder','FontSize',18,'FontWeight','bold'); heading.Layout.Row=1;
layout = uigridlayout(main,[4 2]); layout.RowHeight = repmat({32},1,4); layout.ColumnWidth={210,'1x'}; layout.Layout.Row=2;
out = uitextarea(main,'Editable','off','Value',{'Ready'},'FontSize',14); out.Layout.Row=3;
label1=uilabel(layout,'Text','Day');label1.Layout.Row=1;label1.Layout.Column=1;
day=uidropdown(layout,'Items',{'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'});day.Value='15';
day.Layout.Row=1;day.Layout.Column=2;
label2=uilabel(layout,'Text','Month');label2.Layout.Row=2;label2.Layout.Column=1;
month=uidropdown(layout,'Items',{'January','February','March','April','May','June','July','August','September','October','November','December'});month.Value='August';
month.Layout.Row=2;month.Layout.Column=2;
label3=uilabel(layout,'Text','Year');label3.Layout.Row=3;label3.Layout.Column=1;
year=uidropdown(layout,'Items',{'1900','1901','1902','1903','1904','1905','1906','1907','1908','1909','1910','1911','1912','1913','1914','1915','1916','1917','1918','1919','1920','1921','1922','1923','1924','1925','1926','1927','1928','1929','1930','1931','1932','1933','1934','1935','1936','1937','1938','1939','1940','1941','1942','1943','1944','1945','1946','1947','1948','1949','1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2024','2025','2026','2027','2028','2029','2030'});year.Value='1947';
year.Layout.Row=3;year.Layout.Column=2;
button1=uibutton(layout,'push','Text','Find Day','ButtonPushedFcn',@(src,event) calc());button1.Layout.Row=4;button1.Layout.Column=2;
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
d=str2double(day.Value);m=find(strcmp(month.Items,month.Value));y=str2double(year.Value);
try
dt=datetime(y,m,d);
if dt.Year~=y || dt.Month~=m || dt.Day~=d,show('Invalid date',false);return;end
show(sprintf('%s was a %s',datestr(dt,'dd-mmm-yyyy'),datestr(dt,'dddd')));
catch,show('Invalid date',false);
end
end
end
