% Problem 9: Prime Range
% Components: LowerEditField, UpperEditField, ResultLabel, FindPrimesButton
% Callback-only source: paste methods into App Designer Code View.

function FindPrimesButtonPushed(app,event)
 low=str2double(app.LowerEditField.Value);
 high=str2double(app.UpperEditField.Value);
 if any(~isfinite([low high]))||any(mod([low high],1)~=0)
  app.ResultLabel.Text='Integer limits required'; return;
 end
 if low>high, temp=low; low=high; high=temp; end
 if high-low>100000, app.ResultLabel.Text='Range too large'; return; end
 found=[];
 for k=max(2,low):high
  if isprime(k), found(end+1)=k; end
 end
 if isempty(found)
  app.ResultLabel.Text='No primes (Count = 0)';
 else
  app.ResultLabel.Text=sprintf('%s (Count = %d)',strtrim(sprintf('%d ',found)),numel(found));
 end
end
