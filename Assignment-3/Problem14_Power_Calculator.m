% Problem 14: Power Calculator
% Components: BaseDropDown, ExponentDropDown, ResultLabel, CalculateButton
% Callback-only source: paste methods into App Designer Code View.
% Base items 1-10; exponent items 0-10; values as numeric strings.

function CalculateButtonPushed(app,event)
 b=str2double(app.BaseDropDown.Value); e=str2double(app.ExponentDropDown.Value);
 if any(~isfinite([b e])), app.ResultLabel.Text='Invalid selection'; return; end
 result=b^e;
 if mod(result,2)==0, kind='Even'; else, kind='Odd'; end
 app.ResultLabel.Text=sprintf('%g ^ %g = %g (%s)',b,e,result,kind);
end
