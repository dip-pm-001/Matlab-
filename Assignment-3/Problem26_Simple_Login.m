% Problem 26: Simple Login
% Components: UsernameEditField, PasswordEditField, RoleDropDown, ResultLabel, LoginButton
% Callback-only source: paste methods into App Designer Code View.
% Add private app properties FailedAttempts=0 and ValidLogins={'admin','admin@1','Faculty';'student','student@1','Student'}. Role items Faculty/Student. Demo credentials only, not secure for production.

function LoginButtonPushed(app,event)
 username=char(app.UsernameEditField.Value);
 password=char(app.PasswordEditField.Value);
 role=char(app.RoleDropDown.Value);
 valid=false;
 for k=1:size(app.ValidLogins,1)
  if strcmp(username,app.ValidLogins{k,1}) && ...
     strcmp(password,app.ValidLogins{k,2}) && ...
     strcmp(role,app.ValidLogins{k,3})
   valid=true;
   break;
  end
 end
 if valid
  app.FailedAttempts=0;
  app.ResultLabel.Text=['Login Successful - Welcome ' role];
  app.ResultLabel.FontColor=[0 0.5 0];
 else
  app.FailedAttempts=app.FailedAttempts+1;
  app.ResultLabel.Text='Invalid Credentials';
  app.ResultLabel.FontColor=[1 0 0];
  if app.FailedAttempts>=3
   app.LoginButton.Enable='off';
  end
 end
end
