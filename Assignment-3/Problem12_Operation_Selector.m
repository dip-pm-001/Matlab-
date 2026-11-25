% Problem 12: Operation Selector
% Components: FirstDropDown, OperationDropDown, SecondDropDown, ResultLabel, ComputeButton
% Callback-only source: paste methods into App Designer Code View.
% Items: both numeric dropdowns contain number strings; operation contains Add/Subtract/Multiply/Divide/Modulus.

function ComputeButtonPushed(app,event)
 a=str2double(app.FirstDropDown.Value); b=str2double(app.SecondDropDown.Value);
 if any(~isfinite([a b])), app.ResultLabel.Text='Invalid Input'; return; end
 switch app.OperationDropDown.Value
  case 'Add', ans=a+b; symbol='+';
  case 'Subtract', ans=a-b; symbol='-';
  case 'Multiply', ans=a*b; symbol='*';
  case 'Divide'
   if b==0, app.ResultLabel.Text='Division by zero not allowed'; return; end
   ans=a/b; symbol='/';
  case 'Modulus'
   if b==0, app.ResultLabel.Text='Modulus by zero not allowed'; return; end
   ans=mod(a,b); symbol='mod';
  otherwise, app.ResultLabel.Text='Invalid operation'; return;
 end
 app.ResultLabel.Text=sprintf('%g %s %g = %g',a,symbol,b,ans);
end
