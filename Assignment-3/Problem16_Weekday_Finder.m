% Problem 16: Weekday Finder
% Components: DayDropDown, MonthDropDown, YearDropDown, ResultLabel, FindDayButton
% Callback-only source: paste methods into App Designer Code View.
% Day items 1-31; months January-December; year items 1900-2030. All values are strings.

function FindDayButtonPushed(app,event)
 d=str2double(app.DayDropDown.Value);
 y=str2double(app.YearDropDown.Value);
 months={'January','February','March','April','May','June', ...
         'July','August','September','October','November','December'};
 m=find(strcmp(months,app.MonthDropDown.Value),1);
 if isempty(m)||~isfinite(d)||~isfinite(y)||d~=fix(d)||y~=fix(y)|| ...
     y<1900||y>2030||d<1||d>31
  app.ResultLabel.Text='Invalid date'; return;
 end
 if d>eomday(y,m)
  app.ResultLabel.Text='Invalid date'; return;
 end
 dt=datetime(y,m,d);
 [~,dayName]=weekday(dt,'long');
 app.ResultLabel.Text=sprintf('%s was a %s',datestr(dt,'dd-mmm-yyyy'),dayName);
end
