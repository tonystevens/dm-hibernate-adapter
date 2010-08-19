module Generator
  def self.setClass(className,list)
       f = File.new("#{className}.java","w+")
        code = ""
        code << "package com.src;"
        code << "\n"
        code << "public class #{className} {"
        code << "\n"

        code << "	public #{className}() {"
        code << "\n"

        code << "	}"
        code << "\n"

        list.each do |sub_list|
          code << "	private #{sub_list[0]} #{sub_list[1]};"
          code << "\n"

          code << "	public #{sub_list[0]} get#{sub_list[1].capitalize}() { return #{sub_list[1]}; }"
          code << "\n"
          code << "	public void set#{sub_list[1].capitalize}(#{sub_list[0]} #{sub_list[1]}) { this.#{sub_list[1]} = #{sub_list[1]}; }"
          code << "\n"
        end

        code << "}"
        code << "\n"
        f.puts code
        f.close
  end
end