% Problem 18: Cinema Booking
% Components: SeatTypeDropDown, TicketsDropDown, ResultLabel, BookButton
% Callback-only source: paste methods into App Designer Code View.
% Seat type items Silver/Gold/Platinum; ticket items 1-10.

function BookButtonPushed(app,event)
 switch app.SeatTypeDropDown.Value
  case 'Silver', price=150;
  case 'Gold', price=250;
  case 'Platinum', price=400;
  otherwise, app.ResultLabel.Text='Invalid seat type'; return;
 end
 count=str2double(app.TicketsDropDown.Value);
 if ~isfinite(count)||count<1||count>10||count~=fix(count)
  app.ResultLabel.Text='Invalid tickets'; return;
 end
 subtotal=price*count;
 if count>=4, discount=subtotal*0.10; else, discount=0; end
 app.ResultLabel.Text=sprintf('%d x Rs.%d = Rs.%.2f (%.0f%% off) -> Rs.%.2f', ...
    count,price,subtotal,100*discount/subtotal,subtotal-discount);
end
