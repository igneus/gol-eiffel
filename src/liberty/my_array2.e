-- Compatibility layer bridging interface differences between
-- Liberty standard library and ELKS - see the ISE-specific version.
class MY_ARRAY2[E]

inherit
   SIMPLE_MATRIX[E]
      undefine
         -- concrete features inherited from ANY colliding with
         -- those inherited below from ARRAY2
         fill_tagged_out_memory,
         copy,
         is_equal
      end

insert
   ARRAY2[E]
      rename
         make as array2_make
         resize as array2_resize
      end

create {ANY}
   make

feature {ANY}
   make (lines, columns: INTEGER_32)
      do
         array2_make(1, lines, 1, columns)
      end

   resize (lines, columns: INTEGER_32)
      do
         array2_resize(1, lines, 1, columns)
      end

end
