-- Implementation of the Game of Life matrix simplified
-- by setting a fixed size.
class FINITE_GOL_MATRIX

inherit GOL_MATRIX

create {ANY}
   make

feature {}
   internal: ARRAY[ARRAY2[BOOLEAN]]

feature {ANY} -- Creation
   make (lines, columns: INTEGER_32)
      local
         m: ARRAY2[BOOLEAN]
         i: INTEGER
      do
         create internal.make(1, 2)

         from
            i := 1
         until
            i > 2
         loop
            create m.make(1, lines, 1, columns)
            m.set_all_with(False)
            internal.put(m, i)
            i := i + 1
         end
      end

   next_state
      local
         line, col: INTEGER
      do
         from
            line := 1
         until
            line >= next.line_count
         loop
            from
               col := 1
            until
               col >= next.column_count
            loop
               -- fake
               next.put(not is_live(line, col), line, col)

               col := col + 1
            end

            line := line + 1
         end

         internal.reverse
      end

feature {ANY}
   is_live(line, column: INTEGER_32): BOOLEAN
      do
         Result := curr.item(line, column)
      end

feature {ANY} -- cf. ARRAY2
   line_count: INTEGER_32
      do
         Result := curr.line_count
      end

   column_count: INTEGER_32
      do
         Result := curr.column_count
      end

   put(element: BOOLEAN; line, column: INTEGER_32)
      do
         curr.put(element, line, column)
      end

feature {}
   curr: ARRAY2[BOOLEAN]
      do
         Result := internal.item(1)
      end

   next: ARRAY2[BOOLEAN]
      do
         Result := internal.item(2)
      end

end
