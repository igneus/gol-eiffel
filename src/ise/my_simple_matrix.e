class MY_SIMPLE_MATRIX[E]

inherit
   SIMPLE_MATRIX[E]
      undefine
         -- concrete features inherited from ANY colliding with
         -- those inherited below from ARRAY2
         copy,
         is_equal
      end
   ARRAY2[E]
      rename
         height as line_count,
         width as column_count,
         fill_with as set_all_with
      end

create {ANY}
   make

feature {ANY}
   valid_line(l: INTEGER_32): BOOLEAN
      do
         Result := l >= 1 and l <= line_count
      end

   valid_column(c: INTEGER_32): BOOLEAN
      do
         Result := c >= 1 and c <= column_count
      end

end
