-- Implementation of the Game of Life matrix simplified
-- by setting a fixed size.
class FINITE_GOL_MATRIX

inherit GOL_MATRIX

create {ANY}
   make

feature {}
   matrices: REVERSIBLE_PAIR[MY_ARRAY2[BOOLEAN]]

feature {ANY} -- Creation
   make (lines, columns: INTEGER_32)
      local
         m, n: MY_ARRAY2[BOOLEAN]
      do
         create m.my_make(lines, columns)
         m.set_all_with(False)
         create n.my_make(lines, columns)
         n.set_all_with(False)
         create matrices.make(m, n)
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
               next.put(will_be_live(line, col), line, col)

               col := col + 1
            end

            line := line + 1
         end

         matrices.reverse
      end

feature {ANY}
   is_live(line, column: INTEGER_32): BOOLEAN
      do
         Result := curr.item(line, column)
      end

   will_be_live(line, column: INTEGER_32): BOOLEAN
      local
         neighbors: INTEGER
      do
         neighbors := live_neighbors_count(line, column)

         if is_live(line, column) then
            inspect neighbors
            when 0, 1 then
               Result := False
            when 2, 3 then
               Result := True
            when 4..8 then
               Result := False
            else
               -- TODO: should never be reached, throw exception instead
               Result := False
            end
         else
            if neighbors = 3 then
               Result := True
            else
               Result := False
            end
         end
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
   curr: MY_ARRAY2[BOOLEAN]
      do
         Result := matrices.first
      end

   next: MY_ARRAY2[BOOLEAN]
      do
         Result := matrices.second
      end

   live_neighbors_count(line, column: INTEGER_32): INTEGER_32
      local
         r, l, c: INTEGER_32
      do
         r := 0

         from
            l := line - 1
         until
            l > line + 1
         loop
            -- looks like Eiffel doesn't have an instruction
            -- equivalent to the C-like "continue"
            if curr.valid_line(l) then
               from
                  c := column - 1
               until
                  c > column + 1
               loop
                  -- Eiffel doesn't short-circuit conditional
                  -- evaluation either, so that
                  --
                  -- if curr.valid_column(c) and is_live(l, c) then
                  --
                  -- results at runtime in a contract violation
                  -- when c is not valid
                  -- and we really have to write the two nested
                  -- conditionals.
                  if curr.valid_column(c) and not (l = line and c = column) then
                     if is_live(l, c) then
                        r := r + 1
                     end
                  end

                  c := c + 1
               end
            end

            l := l + 1
         end

         Result := r
      end

end
