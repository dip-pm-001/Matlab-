% Problem 15: Dependent Dropdowns
% Components: DepartmentDropDown, SubjectDropDown, ResultLabel, ShowButton
% Callback-only source: paste methods into App Designer Code View.
% Department items CSE/ECE/ME. ECE and ME subject names are examples; the PDF only specifies CSE.

function DepartmentDropDownValueChanged(app,event)
 switch app.DepartmentDropDown.Value
  case 'CSE'
   app.SubjectDropDown.Items={'DBMS','OS','CN'};
  case 'ECE'
   app.SubjectDropDown.Items={'Digital Electronics','Signals','Communication'};
  case 'ME'
   app.SubjectDropDown.Items={'Thermodynamics','Mechanics','Manufacturing'};
 end
 app.SubjectDropDown.Value=app.SubjectDropDown.Items{1};
end

function ShowButtonPushed(app,event)
 app.ResultLabel.Text=sprintf('%s -> %s selected', ...
   app.DepartmentDropDown.Value,app.SubjectDropDown.Value);
end
