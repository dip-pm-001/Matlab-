% Problem 1: Four Function Calculator
% Components: FirstEditField, SecondEditField, ResultLabel; four buttons
% Callback-only source: paste methods into App Designer Code View.

function SumButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value);
 b=str2double(app.SecondEditField.Value);
 if ~isfinite(a)||~isfinite(b)
  app.ResultLabel.Text='Invalid Input - numbers only'; return;
 end
 app.ResultLabel.Text=sprintf('Result : %g',a+b);
end

function DifferenceButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value);
 b=str2double(app.SecondEditField.Value);
 if ~isfinite(a)||~isfinite(b)
  app.ResultLabel.Text='Invalid Input - numbers only'; return;
 end
 app.ResultLabel.Text=sprintf('Result : %g',a-b);
end

function ProductButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value);
 b=str2double(app.SecondEditField.Value);
 if ~isfinite(a)||~isfinite(b)
  app.ResultLabel.Text='Invalid Input - numbers only'; return;
 end
 app.ResultLabel.Text=sprintf('Result : %g',a*b);
end

function QuotientButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value);
 b=str2double(app.SecondEditField.Value);
 if ~isfinite(a)||~isfinite(b)
  app.ResultLabel.Text='Invalid Input - numbers only'; return;
 end
 if b==0, app.ResultLabel.Text='Division by zero not allowed'; else, app.ResultLabel.Text=sprintf('Result : %g',a/b); end
end
