class GOL_CLI

create {ANY}
   make

feature {}
   matrix: GOL_MATRIX
   args: ARGUMENTS

feature {ANY}
   make
      local
         i: INTEGER
      do
         if args.argument_count > 0 then
            load_matrix(args.argument(1))
         else
            create_default_matrix
         end

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

feature {}
   print_matrix
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

   -- load matrix from a file in the plaintext file format
   -- https://conwaylife.com/wiki/Plaintext
   load_matrix(path: STRING)
      local
         text_file_read: TEXT_FILE_READ
         parsed: MY_ARRAY2[BOOLEAN]
         live: BOOLEAN
         l, c: INTEGER
      do
         create parsed.make(1, 1)

         create text_file_read.connect_to(path)
         if text_file_read.is_connected then
            l := 1
            from
               text_file_read.read_line
            until
               text_file_read.end_of_input
            loop
               if text_file_read.last_string.item(1) = '!' then
                  -- comment, skip
               else
                  if l = 1 then
                     -- set width
                     parsed.resize(1, 1, 1, text_file_read.last_string.count)
                  else
                     -- add line
                     parsed.resize(1, parsed.line_count + 1, 1, parsed.column_count)
                  end

                  from
                     c := 1
                  until
                     c > text_file_read.last_string.count or
                     c > parsed.column_count
                  loop
                     live := False
                     if text_file_read.last_string.item(c) = 'O' then
                        live := True
                     end
                     parsed.put(live, l, c)

                     c := c + 1
                  end
                  l := l + 1
               end

               text_file_read.read_line
            end
            text_file_read.disconnect
         else
            io.put_string("Cannot read file %"" + path + "%".%N")
         end

         create {FINITE_GOL_MATRIX} matrix.make_from_my_array2(parsed)
      end

   create_default_matrix
      do
         create {FINITE_GOL_MATRIX} matrix.make(10, 10)

         matrix.put(True, 7, 1)
         matrix.put(True, 7, 2)
         matrix.put(True, 7, 3)
         matrix.put(True, 8, 3)
         matrix.put(True, 9, 2)
      end

end
