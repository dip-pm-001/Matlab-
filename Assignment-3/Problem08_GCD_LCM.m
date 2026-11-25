% Problem 8: GCD LCM
% Components: FirstEditField, SecondEditField, ResultLabel, GCDButton, LCMButton
% Callback-only source: paste methods into App Designer Code View.

function GCDButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value); b=str2double(app.SecondEditField.Value);
 if any(~isfinite([a b]))||any([a b]<=0)||any(mod([a b],1)~=0)
  app.ResultLabel.Text='Positive integers required'; return;
 end
 app.ResultLabel.Text=sprintf('GCD of %d and %d is %d',a,b,gcd(a,b));
end

function LCMButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value); b=str2double(app.SecondEditField.Value);
 if any(~isfinite([a b]))||any([a b]<=0)||any(mod([a b],1)~=0)
  app.ResultLabel.Text='Positive integers required'; return;
 end
 app.ResultLabel.Text=sprintf('LCM of %d and %d is %d',a,b,lcm(a,b));
end
