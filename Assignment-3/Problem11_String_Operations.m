% Problem 11: String Operations
% Components: WordEditField, ResultLabel, ReverseButton, VowelsButton, PalindromeButton
% Callback-only source: paste methods into App Designer Code View.

function ReverseButtonPushed(app,event)
 s=char(app.WordEditField.Value);
 if isempty(strtrim(s)), app.ResultLabel.Text='Enter a word'; return; end
 app.ResultLabel.Text=['Reversed : ' fliplr(s)];
end

function VowelsButtonPushed(app,event)
 s=lower(char(app.WordEditField.Value));
 if isempty(strtrim(s)), app.ResultLabel.Text='Enter a word'; return; end
 app.ResultLabel.Text=sprintf('Vowels : %d',sum(ismember(s,'aeiou')));
end

function PalindromeButtonPushed(app,event)
 s=lower(char(app.WordEditField.Value));
 if isempty(strtrim(s))
  app.ResultLabel.Text='Enter a word';
 elseif strcmp(s,fliplr(s))
  app.ResultLabel.Text='Palindrome : Yes';
 else
  app.ResultLabel.Text='Palindrome : No';
 end
end
