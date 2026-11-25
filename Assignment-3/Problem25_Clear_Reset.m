% Problem 25: Clear Reset
% Components: FirstEditField, SecondEditField, FirstDropDown, SecondDropDown, SumLabel, DropdownLabel, SumButton, ADDButton, CLEARButton
% Callback-only source: paste methods into App Designer Code View.
% Both inputs must be Text Edit Fields. Initial label text = Sum.

function SumButtonPushed(app,event)
 a=str2double(app.FirstEditField.Value); b=str2double(app.SecondEditField.Value);
 if any(~isfinite([a b])), app.SumLabel.Text='Invalid Input'; return; end
 app.SumLabel.Text=sprintf('Addition is : %g',a+b);
end

function ADDButtonPushed(app,event)
 a=str2double(app.FirstDropDown.Value); b=str2double(app.SecondDropDown.Value);
 if any(~isfinite([a b])), app.DropdownLabel.Text='Invalid Input'; return; end
 app.DropdownLabel.Text=sprintf('After Dropdown Selection : %g',a+b);
end

function CLEARButtonPushed(app,event)
 app.FirstEditField.Value='';
 app.SecondEditField.Value='';
 app.FirstDropDown.Value=app.FirstDropDown.Items{1};
 app.SecondDropDown.Value=app.SecondDropDown.Items{1};
 app.SumLabel.Text='Sum';
 app.DropdownLabel.Text='Sum';
end
