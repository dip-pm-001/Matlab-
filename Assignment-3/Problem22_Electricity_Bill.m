% Problem 22: Electricity Bill
% Components: UnitsEditField, ConnectionDropDown, ResultLabel, CalculateBillButton
% Callback-only source: paste methods into App Designer Code View.
% Connection items Domestic/Commercial.

function CalculateBillButtonPushed(app,event)
 units=str2double(app.UnitsEditField.Value);
 if ~isfinite(units)||units<0
  app.ResultLabel.Text='Invalid units'; return;
 end
 bill=min(units,100)*5 + min(max(units-100,0),100)*7 + max(units-200,0)*9;
 switch app.ConnectionDropDown.Value
  case 'Domestic'
   % No multiplier.
  case 'Commercial'
   bill=bill*1.5;
  otherwise
   app.ResultLabel.Text='Invalid connection'; return;
 end
 app.ResultLabel.Text=sprintf('Bill Amount : Rs.%.2f',bill);
end
