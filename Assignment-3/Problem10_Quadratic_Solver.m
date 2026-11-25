% Problem 10: Quadratic Solver
% Components: AEditField, BEditField, CEditField, ResultLabel, SolveButton
% Callback-only source: paste methods into App Designer Code View.

function SolveButtonPushed(app,event)
 a=str2double(app.AEditField.Value); b=str2double(app.BEditField.Value);
 c=str2double(app.CEditField.Value);
 if any(~isfinite([a b c])), app.ResultLabel.Text='Invalid Input'; return; end
 if a==0, app.ResultLabel.Text='a cannot be zero'; return; end
 d=b^2-4*a*c;
 if d>0
  x1=(-b+sqrt(d))/(2*a); x2=(-b-sqrt(d))/(2*a);
  app.ResultLabel.Text=sprintf('Real & distinct roots : %g, %g',x1,x2);
 elseif d==0
  x=-b/(2*a);
  app.ResultLabel.Text=sprintf('Real & equal roots : %g, %g',x,x);
 else
  realPart=-b/(2*a); imagPart=sqrt(-d)/(2*abs(a));
  app.ResultLabel.Text=sprintf('Complex roots : %g + %gi, %g - %gi',realPart,imagPart,realPart,imagPart);
 end
end
