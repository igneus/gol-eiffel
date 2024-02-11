class MY_ARRAY2[E]

inherit ARRAY2[E]
      rename
         make as my_make,
         height as line_count,
         width as column_count,
         fill_with as set_all_with
      end

create {ANY}
   my_make

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
