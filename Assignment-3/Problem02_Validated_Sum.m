% Problem 2: Validated Sum
% Components: FirstEditField, SecondEditField, ResultLabel, SumButton
% Callback-only source: paste methods into App Designer Code View.

function SumButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value); b=str2double(app.SecondEditField.Value);
 if ~isfinite(a)||~isfinite(b)
  app.ResultLabel.Text='Invalid Input - numbers only';
  app.ResultLabel.FontColor=[1 0 0];
 else
  app.ResultLabel.Text=sprintf('Addition is : %g',a+b);
  app.ResultLabel.FontColor=[0 0.4 0];
 end
end
