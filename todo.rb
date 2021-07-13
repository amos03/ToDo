gem 'activerecord', '=4.2.10'

require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'todo.sqlite3')

class ToDo < ActiveRecord::Base

    field :task, as: :string
    field :deadline, as: :datetime
    field :description, as: :text
end

ToDo.auto_upgrade!

at_exit do
    ActiveRecord::Base.connetion.close
end