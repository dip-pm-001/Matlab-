% Problem 6: Largest Of Three
% Components: FirstEditField, SecondEditField, ThirdEditField, ResultLabel, FindMaxButton
% Callback-only source: paste methods into App Designer Code View.

function FindMaxButtonPushed(app,event)
 v=[str2double(app.FirstEditField.Value),str2double(app.SecondEditField.Value),str2double(app.ThirdEditField.Value)];
 if any(~isfinite(v)), app.ResultLabel.Text='Invalid Input'; return; end
 names={'1st No','2nd No','3rd No'};
 largest=max(v);
 names=names(v==largest);
 app.ResultLabel.Text=sprintf('Largest is %g (%s)',largest,strjoin(names,', '));
end
