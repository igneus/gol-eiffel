class GOL_CLI

create {}
   make

feature {}
   matrix: GOL_MATRIX

   make
      local
         i: INTEGER
      do
         create {FINITE_GOL_MATRIX} matrix.make(10, 10)

         matrix.put(True, 7, 1)
         matrix.put(True, 7, 2)
         matrix.put(True, 7, 3)
         matrix.put(True, 8, 3)
         matrix.put(True, 9, 2)

         from
            i := 0
         until
            i >= 30
         loop
            io.put_integer(i)
            io.put_new_line

            print_matrix
            io.put_new_line

            matrix.next_state
            i := i + 1
         end
      end

   print_matrix
      local
         line, col: INTEGER
      do
         from
            line := 1
         until
            line >= matrix.line_count
         loop
            from
               col := 1
            until
               col >= matrix.column_count
            loop
               if matrix.is_live(line, col) then
                  io.put_character('X')
               else
                  io.put_character('-')
               end

               col := col + 1
            end

            io.put_new_line

            line := line + 1
         end
      end

end
