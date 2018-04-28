if Category.count.zero?
  Category.create(name: 'Эрго-рюкзаки (слинги-рюкзаки)', caption: 'с 4 месяцев')
  Category.create(name: 'Май-слинги', caption: 'с рождения')
  Category.create(name: 'Слинги-рюкзаки для двойни', caption: 'с 4 месяцев')
  Category.create(name: 'Коконы', caption: '')
end

Config.create

Collection.create name: 'Базовая коллекция'
Collection.create name: 'Весна-Лето 2018'
