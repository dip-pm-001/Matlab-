% Problem 19: Compare Selections
% Components: FirstDropDown, SecondDropDown, ResultLabel, CompareButton
% Callback-only source: paste methods into App Designer Code View.
% Both dropdowns contain numeric strings 5,10,...,100.

function CompareButtonPushed(app,event)
 a=str2double(app.FirstDropDown.Value); b=str2double(app.SecondDropDown.Value);
 if any(~isfinite([a b])), app.ResultLabel.Text='Invalid Input'; return; end
 if a==b
  app.ResultLabel.Text='Both are equal'; app.ResultLabel.FontColor=[0 0.5 0];
 elseif a>b
  app.ResultLabel.Text=sprintf('1st No is greater by %g',a-b);
  app.ResultLabel.FontColor=[0 0 1];
 else
  app.ResultLabel.Text=sprintf('2nd No is greater by %g',b-a);
  app.ResultLabel.FontColor=[1 0.5 0];
 end
end
