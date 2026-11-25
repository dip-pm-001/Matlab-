% Problem 7: Swap Two Numbers
% Components: FirstEditField, SecondEditField, ResultLabel, SwapButton
% Callback-only source: paste methods into App Designer Code View.

function SwapButtonPushed(app,event)
 a=app.FirstEditField.Value; b=app.SecondEditField.Value;
 if isempty(strtrim(a))||isempty(strtrim(b))
  app.ResultLabel.Text='Both fields required'; return;
 end
 app.FirstEditField.Value=b; app.SecondEditField.Value=a;
 app.ResultLabel.Text='Swapped successfully';
end
