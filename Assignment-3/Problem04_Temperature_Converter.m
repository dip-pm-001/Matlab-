% Problem 4: Temperature Converter
% Components: TemperatureEditField, ResultLabel, CtoFButton, FtoCButton
% Callback-only source: paste methods into App Designer Code View.

function CtoFButtonPushed(app,event)
 c=str2double(app.TemperatureEditField.Value);
 if ~isfinite(c), app.ResultLabel.Text='Invalid Input'; return; end
 app.ResultLabel.Text=sprintf('%g °C = %.2f °F',c,c*9/5+32);
end

function FtoCButtonPushed(app,event)
 f=str2double(app.TemperatureEditField.Value);
 if ~isfinite(f), app.ResultLabel.Text='Invalid Input'; return; end
 app.ResultLabel.Text=sprintf('%g °F = %.2f °C',f,(f-32)*5/9);
end
