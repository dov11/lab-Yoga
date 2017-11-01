@shopping_cart = []

@departments = [ :mats, :props, :clothes, :books ]

@products = {
  mats: [
    { reference_number: 1231, name: "Super Lite Mat", price: 10 },
    { reference_number: 1232, name: "Power Mat", price: 20 },
  ],
  props: [
    { reference_number: 1233, name: "Block", price: 30 },
    { reference_number: 1234, name: "Meditation Cushion", price: 30 },
  ],
  clothes: [
    { reference_number: 1235, name: "The Best T-shirt", price: 200 },
    { reference_number: 1236, name: "The Cutest Yoga Pants", price: 300 },
  ],
  books: [
    { reference_number: 1237, name: "Bring Yoga To Life", price: 30 },
    { reference_number: 1238, name: "Light On Yoga", price: 10 },
  ]
}

def showing_the_cart
  @shopping_cart.each do |product|
    puts "#{product[:name]} - #{product[:price]}$"
  end
end

def count_total_price
total = 0
  @shopping_cart.each do |product|
    total += product[:price]
  end
  puts "total: #{total}$"
end
print @shopping_cart

puts "Welcome to our cosy Yoga Shop!\nWe have the following departments:\n"

def show_departments
  @departments.each_with_index {|department, index| puts "#{index+1}: #{department}"}
  puts "Please select the department you wish to visit(1-4)"
  @choice1 = gets.to_i
  @products[@departments[@choice1-1]].each do |value|
    puts "#{value[:name]}, price: #{value[:price]}$, order number: #{value[:reference_number]}"
  end
  puts "Please select the product you like?"
  @product_choice = gets.chomp.split(' ').map!{|el|el.capitalize}.join(" ")
  @products[@departments[@choice1-1]].each do |value|
     if (value.select {|k,v| v==@product_choice} != {})
       @shopping_cart<<value
     end
   end
   showing_the_cart
   count_total_price
   puts "Continue shopping?(Y/N)"
   continue_answer = gets.chomp.capitalize
   if continue_answer=='Y'
     show_departments
   else
     showing_the_cart
     count_total_price
     puts "Thank you for shopping with us"
   end

end

show_departments
