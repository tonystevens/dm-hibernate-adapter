# Basic requires
require 'rubygems'
require 'java'
require 'jruby/core_ext'
require 'hibernate'

module Cust_log
  def self.initialize(databaseName)
    Hibernate.dialect = Hibernate::Dialects::MySQL
    Hibernate.current_session_context_class = "thread"

    Hibernate.connection_driver_class = Hibernate::Drivers::MySQL
    Hibernate.connection_url = Hibernate::Urls::MySQL + databaseName
    Hibernate.connection_username = "root"
    Hibernate.connection_password = "root"
    Hibernate.properties["hbm2ddl.auto"] = "update"
        
  end

  def self.setup(mapping_name, operate_type, value_object)
    Hibernate.add_model mapping_name
    Hibernate.tx do |session|
       case operate_type
         when "store"
          # Create customer and store it
          session.save(value_object)
          puts "Stored!"
         when "update"
           session.update(value_object)
           puts "Updated!"
         when "delete"
           session.delete(value_object)
           puts "Deleted!"
         when "list"
          # List all customers
          list = session.create_query('from Customer').list
          puts "Listing all customers:"
          list.each do |cust|
            puts "id: #{cust.id} title: #{cust.name} birthday: #{cust.birthday}"
          end
        else
          puts "Usage:\n\tstore <title>\n\tlist"
      end
    end
  end

end

