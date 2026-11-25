% Problem 21: Currency Converter
% Components: AmountEditField, CurrencyDropDown, ResultLabel, ConvertButton
% Callback-only source: paste methods into App Designer Code View.
% Required private app properties: USDToINR=85, EURToINR=92, GBPToINR=108, JPYToINR=0.58. Illustrative fixed rates, not live. Currency items USD/EUR/GBP/JPY.

function ConvertButtonPushed(app,event)
 amount=str2double(app.AmountEditField.Value);
 if ~isfinite(amount)||amount<0
  app.ResultLabel.Text='Invalid amount'; return;
 end
 switch app.CurrencyDropDown.Value
  case 'USD', rate=app.USDToINR;
  case 'EUR', rate=app.EURToINR;
  case 'GBP', rate=app.GBPToINR;
  case 'JPY', rate=app.JPYToINR;
  otherwise, app.ResultLabel.Text='Invalid currency'; return;
 end
 if ~isfinite(rate)||rate<=0, app.ResultLabel.Text='Invalid rate'; return; end
 app.ResultLabel.Text=sprintf('Rs.%.2f = %.2f %s', ...
   amount,amount/rate,app.CurrencyDropDown.Value);
end
