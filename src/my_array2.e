-- Compatibility layer bridging interface differences between
-- Liberty standard library and ELKS - see the ISE-specific version.
class MY_ARRAY2[E]

inherit ARRAY2[E]
      rename
         make as array2_make
      end

create {ANY}
   make

feature {ANY}
   make (lines, columns: INTEGER_32)
      do
         array2_make(1, lines, 1, columns)
      end

end
