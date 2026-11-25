% Problem 5: BMI Calculator
% Components: WeightEditField, HeightEditField, BMILabel, CategoryLabel, ComputeBMIButton
% Callback-only source: paste methods into App Designer Code View.

function ComputeBMIButtonPushed(app,event)
 w=str2double(app.WeightEditField.Value);
 h=str2double(app.HeightEditField.Value);
 if ~isfinite(w)||~isfinite(h)||w<=0||h<=0
  app.BMILabel.Text='Invalid Input'; app.CategoryLabel.Text='Weight and height must be positive'; return;
 end
 bmi=w/h^2;
 if bmi<18.5
  category='Underweight';
 elseif bmi<25
  category='Normal';
 elseif bmi<30
  category='Overweight';
 else
  category='Obese';
 end
 app.BMILabel.Text=sprintf('BMI : %.2f',bmi);
 app.CategoryLabel.Text=['Category : ' category];
end
