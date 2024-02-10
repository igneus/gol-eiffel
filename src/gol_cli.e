class GOL_CLI

create {}
   make

feature {}
   matrix: GOL_MATRIX

   make
      do
         create {FINITE_GOL_MATRIX} matrix.make(10, 10)

         matrix.put(True, 3, 3)
         matrix.put(True, 3, 4)
         matrix.put(True, 3, 5)
         matrix.put(True, 4, 5)
         matrix.put(True, 5, 4)

         print_matrix
         io.put_new_line
         print_matrix
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
