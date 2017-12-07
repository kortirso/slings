if Category.count == 0
    category = Category.new name: 'Эрго-рюкзаки (слинги-рюкзаки)', caption: ''
    File.open("#{Rails.root}/db/category_images/ergo-sling.jpg") { |f| category.image = f }
    category.save

    category = Category.new name: 'Май-слинги', caption: ''
    File.open("#{Rails.root}/db/category_images/mai-sling.jpg") { |f| category.image = f }
    category.save

    category = Category.create name: 'Эрго-рюкзаки для двойни', caption: ''
    File.open("#{Rails.root}/db/category_images/twins.jpg") { |f| category.image = f }
    category.save

    category = Category.create name: 'Коконы', caption: ''
    File.open("#{Rails.root}/db/category_images/cocoon.jpg") { |f| category.image = f }
    category.save
end
