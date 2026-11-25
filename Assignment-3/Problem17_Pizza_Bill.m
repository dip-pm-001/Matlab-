% Problem 17: Pizza Bill
% Components: SizeDropDown, QuantityDropDown, ResultLabel, GenerateBillButton
% Callback-only source: paste methods into App Designer Code View.
% Size items Small/Medium/Large; quantity items 1-10.

function GenerateBillButtonPushed(app,event)
 switch app.SizeDropDown.Value
  case 'Small', price=200;
  case 'Medium', price=350;
  case 'Large', price=500;
  otherwise, app.ResultLabel.Text='Invalid size'; return;
 end
 qty=str2double(app.QuantityDropDown.Value);
 if ~isfinite(qty)||qty<1||qty>10||qty~=fix(qty)
  app.ResultLabel.Text='Invalid quantity'; return;
 end
 subtotal=price*qty; gst=subtotal*0.05;
 app.ResultLabel.Text=sprintf('Total Rs.%.2f + GST Rs.%.2f = Rs.%.2f',subtotal,gst,subtotal+gst);
end
