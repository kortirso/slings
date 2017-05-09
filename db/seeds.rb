if Category.count == 0
    category = Category.new name: 'Слинг-рюкзаки', caption: ''
    File.open("#{Rails.root}/db/category_images/ergo-sling.png") { |f| category.image = f }
    category.save

    category = Category.new name: 'Май-слинги', caption: ''
    File.open("#{Rails.root}/db/category_images/mai-sling.png") { |f| category.image = f }
    category.save

    category = Category.create name: 'Шарф-рюкзаки', caption: ''
    category = Category.create name: 'Слинг-шарфы', caption: ''
    category = Category.create name: 'Эрго-рюкзаки для двойни', caption: ''
    category = Category.create name: 'Слинги с кольцами', caption: ''
end
