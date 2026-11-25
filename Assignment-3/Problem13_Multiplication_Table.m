% Problem 13: Multiplication Table
% Components: NumberDropDown, LimitDropDown, TableTextArea, GenerateButton
% Callback-only source: paste methods into App Designer Code View.
% NumberDropDown Items: 1-20; LimitDropDown Items: 5,10,15,20. Use strings, and a Text Area for output.

function GenerateButtonPushed(app,event)
 n=str2double(app.NumberDropDown.Value);
 count=str2double(app.LimitDropDown.Value);
 if ~isfinite(n)||~isfinite(count)||count<1||count~=fix(count)
  app.TableTextArea.Value={'Invalid selection'}; return;
 end
 output=cell(count,1);
 for k=1:count, output{k}=sprintf('%d x %d = %d',n,k,n*k); end
 app.TableTextArea.Value=output;
end
