class TEST_FINITE_GOL_MATRIX_INITIAL_STATE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         matrix: GOL_MATRIX
         line, col, i: INTEGER
      do
         create {FINITE_GOL_MATRIX} matrix.make(3, 3)

         i := 0

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
               assert(not matrix.is_live(line, col))

               col := col + 1
               i := i + 1
            end

            line := line + 1
         end

         assert(i = 9) -- make sure
      end

end
