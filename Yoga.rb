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
progress_bar
#print "\r"
#print "\e[J"
  total = 0
  @shopping_cart.each do |product|
    puts "#{product[:name]} - #{product[:price]}$\n"
    total += product[:price]
  end
  puts "-------\nTotal: #{total}$\n********"
end

def progress_bar
  15.times do
    print "-"
    sleep 0.1
  end
end

def product_search
  #user choice of a product - converted to array, each element capitalized, joined back together
  @product_choice = gets.chomp.split(' ').map!{|el|el.capitalize}.join(" ")
  #searching for this product in our department
  counter = 0
  @products[@departments[@choice1-1]].each do |value|

     if (value.select {|k,v| v==@product_choice} != {})
       @shopping_cart<<value
       counter = 1
     end
   end

   if counter == 0
     puts "Sorry, no such product\nPlease choose again"
     showing_department
     product_search
   else
     showing_the_cart
   end
 end

def showing_department
  @products[@departments[@choice1-1]].each do |value|
    puts "#{value[:name]}, price: #{value[:price]}$, order number: #{value[:reference_number]}\n"
    puts "Please select the product you like\n"
  end
end

puts "Welcome to our cosy Yoga Shop!\nWe have the following departments:\n"

def shopping
#showing departments
  @departments.each_with_index {|department, index| puts "#{index+1}: #{department}"}
  puts "Please select the department you wish to visit(1-4)"
#store customer's choice
  @choice1 = gets.to_i
#show what is in the department
  showing_department

  product_search

   #prompting to continue shopping
   puts "Continue shopping?(Y/N)"
   continue_answer = gets.chomp.capitalize
   if continue_answer=='Y'
#restarting if yes
     shopping
   else
     #showing the total and cart and thank for shopping
     showing_the_cart

     puts "Thank you for shopping with us"
   end

end

shopping
