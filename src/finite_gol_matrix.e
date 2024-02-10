-- Implementation of the Game of Life matrix simplified
-- by setting a fixed size.
class FINITE_GOL_MATRIX

inherit GOL_MATRIX

create {ANY}
   make

feature {}
   internal: ARRAY2[BOOLEAN]

feature {ANY} -- Creation
   make (lines, columns: INTEGER_32)
      do
         create internal.make(1, lines, 1, columns)
         internal.set_all_with(False)
      end

feature {ANY}
   is_live(line, column: INTEGER_32): BOOLEAN
      do
         Result := internal.item(line, column)
      end

feature {ANY} -- cf. ARRAY2
   line_count: INTEGER_32
      do
         Result := internal.line_count
      end

   column_count: INTEGER_32
      do
         Result := internal.column_count
      end

   put(element: BOOLEAN; line, column: INTEGER_32)
      do
         internal.put(element, line, column)
      end

end
