# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'active_record/fixtures'


ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/website/fixtures", "beers")

ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/website/fixtures", "beer_images")

ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/website/fixtures", "drinks")

ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/website/fixtures", "drink_images")


ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/mysite/fixtures", "plates")

ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/mysite/fixtures", "parts")

ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/mysite/fixtures", "templates")

ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/public/mysite/fixtures", "plate_parts")

