% Problem 24: Combined Compare
% Components: FirstEditField, SecondEditField, FirstDropDown, SecondDropDown, SumLabel, DropdownLabel, CompareLabel, SumButton, ADDButton, CompareButton
% Callback-only source: paste methods into App Designer Code View.
% Add private app properties EditTotal=NaN; DropTotal=NaN. Dropdowns contain number strings.

function SumButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value); b=str2double(app.SecondEditField.Value);
 if any(~isfinite([a b]))
  app.EditTotal=NaN; app.SumLabel.Text='Invalid Input'; return;
 end
 app.EditTotal=a+b;
 app.SumLabel.Text=sprintf('Addition is : %g',app.EditTotal);
end

function ADDButtonPushed(app,event)
 a=str2double(app.FirstDropDown.Value); b=str2double(app.SecondDropDown.Value);
 if any(~isfinite([a b]))
  app.DropTotal=NaN; app.DropdownLabel.Text='Invalid Input'; return;
 end
 app.DropTotal=a+b;
 app.DropdownLabel.Text=sprintf('After Dropdown Selection : %g',app.DropTotal);
end

function CompareButtonPushed(app,event)
 if ~isfinite(app.EditTotal)||~isfinite(app.DropTotal)
  app.CompareLabel.Text='Calculate both totals first'; return;
 end
 if app.EditTotal>app.DropTotal
  app.CompareLabel.Text=sprintf('Edit total is greater by %g',app.EditTotal-app.DropTotal);
 elseif app.DropTotal>app.EditTotal
  app.CompareLabel.Text=sprintf('Dropdown total is greater by %g',app.DropTotal-app.EditTotal);
 else
  app.CompareLabel.Text='Both totals are equal';
 end
end
