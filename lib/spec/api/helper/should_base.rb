module Spec
  
  class ShouldBase

		def default_message(expectation, expected=:no_expectation_specified)
      message = wrap(@target)
      message << " #{expectation}"
      if (expected != :no_expectation_specified)
        message << " " << wrap(expected)
      end
      message
   	end
   	
   	def wrap(obj)
		  if obj == true
		   "<true>"
		  elsif obj == false
		   "<false>"
		  elsif obj.nil?
		    "nil"
		  elsif obj.kind_of? Class
		    "<#{obj.name}>"
		  elsif obj.kind_of? Proc
		    "<Proc>"
	    elsif (obj.kind_of? Array) || (obj.kind_of? String)
	      "#{obj.inspect}"
	    elsif obj.inspect.include? "<"
        "#{obj.class} #{obj.inspect}"
      else
        "#{obj.class} <#{obj.inspect}>"
      end
 	  end

		def fail_with_message(message)
			Kernel::raise(Spec::Api::ExpectationNotMetError.new(message))
		end

  end
  
end
