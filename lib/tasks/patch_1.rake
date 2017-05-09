namespace :patching do
    desc 'Fix categories'
    task patch_1: :environment do
        category = Category.find_by name: 'Слинг-рюкзаки'
        category.update caption: 'с 4 месяцев'

        category = Category.find_by name: 'Май-слинги'
        category.update caption: 'с рождения'

        category = Category.find_by name: 'Шарф-рюкзаки'
        category.caption = 'с рождения'
        File.open("#{Rails.root}/db/category_images/sharf-ergo.png") { |f| category.image = f }
        category.save

        category = Category.find_by name: 'Слинг-шарфы'
        category.caption = 'с рождения'
        File.open("#{Rails.root}/db/category_images/sling-sharf.png") { |f| category.image = f }
        category.save

        category = Category.find_by name: 'Эрго-рюкзаки для двойни'
        category.name = 'Слинг-рюкзаки для двойни'
        category.caption = 'с 4 месяцев'
        File.open("#{Rails.root}/db/category_images/twince.png") { |f| category.image = f }
        category.save
    end
end