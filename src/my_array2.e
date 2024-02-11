-- Compatibility layer bridging interface differences between
-- Liberty standard library and ELKS - see the ISE-specific version.
class MY_ARRAY2[E]

inherit ARRAY2[E]

create {ANY}
   my_make

feature {ANY}
   my_make (lines, columns: INTEGER_32)
      do
         make(1, lines, 1, columns)
      end

end
