if Category.count.zero?
    category = Category.new name: 'Эрго-рюкзаки (слинги-рюкзаки)', caption: ''
    File.open("#{Rails.root}/db/category_images/ergo-sling.jpg") { |f| category.image = f }
    category.save

    category = Category.new name: 'Май-слинги', caption: ''
    File.open("#{Rails.root}/db/category_images/mai-sling.jpg") { |f| category.image = f }
    category.save

    category = Category.new name: 'Слинги-рюкзаки для двойни', caption: ''
    File.open("#{Rails.root}/db/category_images/twins.jpg") { |f| category.image = f }
    category.save

    category = Category.new name: 'Коконы', caption: ''
    File.open("#{Rails.root}/db/category_images/cocoon.jpg") { |f| category.image = f }
    category.save
end

Config.create

Collection.create name: 'Базовая коллекция'
Collection.create name: 'Весна-Лето 2018'