-- Prints each generation to the console
class CONSOLE_PRESENTER

inherit GOL_PRESENTER

feature {ANY}

   present (matrix: GOL_MATRIX)
      local
         i: INTEGER
         sleep_timer: SLEEP_TIMER
      do
         -- Liberty allows calling the method on the bare integer
         -- literal
         --   `500000.to_natural_32`
         -- for ISE the parentheses are required
         create {MY_SLEEP_TIMER} sleep_timer.make((250000).to_natural_32)

         from
            i := 1
         until
            i >= 30
         loop
            io.put_integer(i)
            io.put_new_line

            print_matrix(matrix)
            io.put_new_line

            matrix.next_state
            i := i + 1
            sleep_timer.sleep
         end
      end

feature {}

   print_matrix(matrix: GOL_MATRIX)
      local
         line, col: INTEGER
      do
         from
            line := 1
         until
            line > matrix.line_count
         loop
            from
               col := 1
            until
               col > matrix.column_count
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
