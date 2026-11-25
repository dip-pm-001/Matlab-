% Problem 23: Marks To Grade
% Components: MarksEditField, TotalDropDown, SchemeDropDown, ResultLabel, EvaluateButton
% Callback-only source: paste methods into App Designer Code View.
% Total items 50/100; scheme items Percentage/CGPA.

function EvaluateButtonPushed(app,event)
 marks=str2double(app.MarksEditField.Value);
 total=str2double(app.TotalDropDown.Value);
 if ~isfinite(marks)||~isfinite(total)||marks<0||marks>total||total<=0
  app.ResultLabel.Text='Invalid marks'; return;
 end
 percentage=marks/total*100;
 if percentage>=90, grade='O';
 elseif percentage>=80, grade='E';
 elseif percentage>=70, grade='A';
 elseif percentage>=60, grade='B';
 elseif percentage>=50, grade='C';
 else, grade='F';
 end
 if strcmp(app.SchemeDropDown.Value,'CGPA')
  app.ResultLabel.Text=sprintf('%.2f%% -> CGPA %.1f, Grade %s',percentage,percentage/10,grade);
 else
  app.ResultLabel.Text=sprintf('Percentage : %.2f%%, Grade %s',percentage,grade);
 end
end
