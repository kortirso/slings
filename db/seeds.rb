if Category.count == 0
    category = Category.new name: 'Эрго-рюкзаки', caption: ''
    File.open("#{Rails.root}/db/category_images/nemo.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Май-слинги', caption: ''
    File.open("#{Rails.root}/db/category_images/mai-sling.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Слинги с кольцами', caption: ''
    File.open("#{Rails.root}/db/category_images/with_rings.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Шарф-рюкзаки', caption: ''
    File.open("#{Rails.root}/db/category_images/grey.png") { |f| category.image = f }
    category.save
end

if Product.count == 0
    product = Product.new name: 'Яркие цветы', price: 3400, amount: 0, category: Category.find_by(name: 'Эрго-рюкзаки')
    File.open("#{Rails.root}/db/slings_images/bright_flowers.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Голубой спорт', price: 2600, amount: 0, category: Category.find_by(name: 'Май-слинги')
    File.open("#{Rails.root}/db/slings_images/blue_sport.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Натур', price: 2200, amount: 0, category: Category.find_by(name: 'Слинги с кольцами')
    File.open("#{Rails.root}/db/slings_images/natur.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Серый', price: 3500, amount: 0, category: Category.find_by(name: 'Шарф-рюкзаки')
    File.open("#{Rails.root}/db/slings_images/grey.png") { |f| product.image = f }
    product.save
end