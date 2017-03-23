if Category.count == 0
    category = Category.new name: 'Эрго-рюкзак', caption: 'Примерное описание категории'
    File.open("#{Rails.root}/db/category_images/nemo.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Май-слинг', caption: 'Примерное описание категории'
    File.open("#{Rails.root}/db/category_images/mai-sling.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Слинг с кольцами', caption: 'Примерное описание категории'
    File.open("#{Rails.root}/db/category_images/with_rings.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Шарф-рюкзак', caption: 'Примерное описание категории'
    File.open("#{Rails.root}/db/category_images/grey.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Слинг-шарф', caption: 'Примерное описание категории'
    File.open("#{Rails.root}/db/category_images/bordo.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Эрго-рюкзак для двойни', caption: 'Примерное описание категории'
    File.open("#{Rails.root}/db/category_images/twins.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Аксессуары', caption: 'Примерное описание категории'
    File.open("#{Rails.root}/db/category_images/accessuar.png") { |f| category.image = f }
    category.save
end

if Product.count == 0
    product = Product.new name: 'Яркие цветы', price: 3400, amount: 0, category: Category.find_by(name: 'Эрго-рюкзак')
    File.open("#{Rails.root}/db/slings_images/bright_flowers.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Голубой спорт', price: 2600, amount: 0, category: Category.find_by(name: 'Май-слинг')
    File.open("#{Rails.root}/db/slings_images/blue_sport.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Натур', price: 2200, amount: 0, category: Category.find_by(name: 'Слинг с кольцами')
    File.open("#{Rails.root}/db/slings_images/natur.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Серый', price: 3500, amount: 0, category: Category.find_by(name: 'Шарф-рюкзак')
    File.open("#{Rails.root}/db/slings_images/grey.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Бордо', price: 3400, amount: 0, category: Category.find_by(name: 'Слинг-шарф')
    File.open("#{Rails.root}/db/slings_images/bordo.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Для двойни', price: 3300, amount: 0, category: Category.find_by(name: 'Эрго-рюкзак для двойни')
    File.open("#{Rails.root}/db/slings_images/twins.png") { |f| product.image = f }
    product.save

    product = Product.new name: 'Слингобусы "Морские"', price: 620, amount: 0, category: Category.find_by(name: 'Аксессуары')
    File.open("#{Rails.root}/db/slings_images/sea.png") { |f| product.image = f }
    product.save
end