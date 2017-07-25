pdf.move_down(300)
pdf.define_grid(:columns => 5, :rows => 8, :gutter => 10) 
pdf.font_size 8

pdf.grid([0,0], [1,1]).bounding_box do 
  pdf.text  "INVOICE", :size => 18, :style => :bold
  pdf.text "Invoice No: #{@invoice.id}", :align => :left
  pdf.text "Date: #{Date.today.to_s(:invoice_date)}", :align => :left
  pdf.move_down 10
  
  pdf.text "Bill to:"
  pdf.text "#{client_info.name}"
  pdf.text "#{client_info.address} #{client_info.city} #{client_info.zip}"
  pdf.text "Tel No: #{client_info.phone}"
  pdf.text "Email: #{client_info.email}"
end


pdf.grid([0,3.6], [1,4]).bounding_box do 
  # Assign the path to your file name first to a local variable.
  logo_path = File.expand_path('../../../../public/yourbusiness_logo.png', __FILE__)

  # Displays the image in your PDF. Dimensions are optional.
  pdf.image logo_path, :width => 100, :height => 100, :position => :left

  # Company address
  pdf.move_down(5)
  pdf.text "Bill from:"
  pdf.text "#{Setting::business_name}", :align => :left
  pdf.text "#{Setting::business_address}", :align => :left
  pdf.text "#{Setting::business_phone}", :align => :left
  pdf.text "#{Setting::business_email}", :align => :left
end

pdf.text "Invoice dates:", :align => :right
pdf.text "Created: #{@invoice.created_at.to_s(:invoice_date)} / Due: #{@invoice.due_date.to_s(:invoice_date)}", :align => :right
pdf.move_down 10

pdf.text "Invoice details:", :style => :bold_italic
pdf.stroke_horizontal_rule

pdf.move_down 20

items = [["Qty", "SKU", "Description", "Price", "Sub Total", "Tax", "Total"]]

if service_invoice_lines.present?

	items += service_invoice_lines.each.map do |invoice|
	  [
		invoice.qty,
		invoice.sku,
		invoice.description,
		number_to_currency(invoice.price),
		number_to_currency(invoice.sub_total),
		number_to_currency(invoice.tax),
		number_to_currency(invoice.total_price)
	  ]
	end


	pdf.table items, :header => true, 
	  :column_widths => { 0 => 30, 1 => 70, 2 => 240, 3 => 50, 4 => 50, 5 => 50, 6 => 50},
	  :cell_style => {:height => 12, :padding => [2,2,2,2], :border_widths => [0.3, 0.3, 0.3, 0.3]},
	  :row_colors => ["d2e3ed", "FFFFFF"] do
		style(columns(7)) {|x| x.align = :right }
	end

	pdf.move_down 10
	pdf.text "Service sub total: #{number_to_currency @invoice.srv_sub_totals}", :align => :right
	pdf.text "Service tax: #{Setting::tax_type} #{number_to_currency @invoice.srv_tax_totals}", :align => :right
	pdf.text "Service total: #{number_to_currency @invoice.srv_price_totals}", :align => :right
	pdf.move_down 10

end


items = [["Qty", "SKU", "Description", "Price", "Sub Total", "Tax", "Total"]]

if product_invoice_lines.present?

	items += product_invoice_lines.each.map do |invoice|
	  [
		invoice.qty,
		invoice.sku,
		invoice.description,
		number_to_currency(invoice.price),
		number_to_currency(invoice.sub_total),
		number_to_currency(invoice.tax),
		number_to_currency(invoice.total_price)
	  ]
	end


	pdf.table items, :header => true, 
	  :column_widths => { 0 => 30, 1 => 70, 2 => 240, 3 => 50, 4 => 50, 5 => 50, 6 => 50},
	  :cell_style => {:height => 12, :padding => [2,2,2,2], :border_widths => [0.3, 0.3, 0.3, 0.3]},
	  :row_colors => ["d2e3ed", "FFFFFF"] do
		style(columns(7)) {|x| x.align = :right }
	end

	pdf.move_down 10
	pdf.text "Parts sub total: #{number_to_currency @invoice.prod_sub_totals}", :align => :right
	pdf.text "Parts tax: #{Setting::tax_type} #{number_to_currency @invoice.prod_tax_totals}", :align => :right
	pdf.text "Parts total: #{number_to_currency @invoice.prod_price_totals}", :align => :right

end


pdf.move_down 10

pdf.text "Invoice sub total: #{number_to_currency @invoice.inv_sub_totals}", :style => :bold, :align => :right
pdf.text "Invoice tax: #{Setting::tax_type} #{number_to_currency @invoice.inv_tax_totals}", :style => :bold, :align => :right
pdf.text "Invoice total: #{number_to_currency @invoice.inv_price_totals}", :style => :bold, :align => :right

pdf.move_down 10

if @invoice.invoice_note.present?

	pdf.text "Invoice note:"
	pdf.text "#{@invoice.invoice_note}"

end


# pdf.move_down 10
# pdf.text "..............................."
# pdf.text "Signature/Company Stamp"

pdf.move_down 10
pdf.stroke_horizontal_rule

pdf.bounding_box([pdf.bounds.right - 50, pdf.bounds.bottom], :width => 60, :height => 20) do
  pagecount = pdf.page_count
  pdf.text "Page #{pagecount}"
end


