-- Prints each generation to the console
class CONSOLE_PRESENTER

inherit GOL_PRESENTER

create {ANY}
   make

feature {ANY}

   make (generations: INTEGER; sleep: INTEGER)
      do
         max_generations := generations
         sleep_milliseconds := sleep
      end

   present (matrix: GOL_MATRIX)
      local
         i: INTEGER
         sleep_timer: SLEEP_TIMER
      do
         create {MY_SLEEP_TIMER} sleep_timer.make((sleep_milliseconds * 1000).to_natural_32)

         from
            i := 1
         until
            i > max_generations
         loop
            if i > 1 then
               sleep_timer.sleep
            end

            io.put_integer(i)
            io.put_new_line

            print_matrix(matrix)
            io.put_new_line

            matrix.next_state
            i := i + 1
         end
      end

feature {}

   max_generations, sleep_milliseconds: INTEGER

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
