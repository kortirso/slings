namespace :patching do
    desc 'Rename categories'
    task patch_2: :environment do
        Category.find_by(name: 'Слинг-рюкзаки').update(name: 'Слинги-рюкзаки')
        Category.find_by(name: 'Слинг-рюкзаки для двойни').update(name: 'Слинги-рюкзаки для двойни')
        Category.find_by(name: 'Слинг-шарфы').update(name: 'Слинги-шарфы')
        Category.find_by(name: 'Шарф-рюкзаки').update(name: 'Шарфы-рюкзаки')
        Category.create name: 'Ткани', caption: ''
    end
end