% Problem 3: Simple Interest
% Components: PrincipalEditField, RateEditField, TimeEditField, InterestLabel, AmountLabel, CalculateButton
% Callback-only source: paste methods into App Designer Code View.

function CalculateButtonPushed(app,event)
 p=str2double(app.PrincipalEditField.Value);
 r=str2double(app.RateEditField.Value);
 t=str2double(app.TimeEditField.Value);
 if any(~isfinite([p r t]))||any([p r t]<0)
  app.InterestLabel.Text='Invalid Input'; app.AmountLabel.Text='Enter nonnegative numbers'; return;
 end
 si=p*r*t/100;
 app.InterestLabel.Text=sprintf('Interest : %.2f',si);
 app.AmountLabel.Text=sprintf('Amount : %.2f',p+si);
end
