require 'rubygems'
require 'java'
require 'jruby/core_ext'
require 'hibernate'
require 'Customerlog'
require 'fileutils'

if File.exist?("com/src/Customers.class") then
  puts "JAVA CLASS ALREADY EXISTS"
else
  list = [["int","id"],
          ["String","name"],
          ["String","birthday"]]
  require 'com/src/java_class_generator'
  Generator.setClass("Customers",list)
  if File.exist?("Customers.java") then
    %x{javac Customers.java}
    FileUtils.mv('Customers.class', './com/src')
    FileUtils.rm('Customers.java')
  else
    puts ("No java file!")
  end

end

include Java
import 'com.src.Customers'

  Cust_log.initialize("exercises")

  cust = Customers.new
  cust.setName("Frank2")
  cust.setBirthday("1989-01-30")

  Cust_log.setup("Customer.hbm.xml", "store", cust)