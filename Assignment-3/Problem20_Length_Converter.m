% Problem 20: Length Converter
% Components: ValueEditField, FromDropDown, ToDropDown, ResultLabel, ConvertButton
% Callback-only source: paste methods into App Designer Code View.
% Both unit dropdowns contain mm/cm/m/km.

function ConvertButtonPushed(app,event)
 value=str2double(app.ValueEditField.Value);
 if ~isfinite(value), app.ResultLabel.Text='Invalid Input'; return; end
 units={'mm','cm','m','km'};
 factors=[0.001 0.01 1 1000];
 from=find(strcmp(units,app.FromDropDown.Value),1);
 to=find(strcmp(units,app.ToDropDown.Value),1);
 if isempty(from)||isempty(to), app.ResultLabel.Text='Invalid unit'; return; end
 answer=value*factors(from)/factors(to);
 app.ResultLabel.Text=sprintf('%g %s = %g %s',value,units{from},answer,units{to});
end
