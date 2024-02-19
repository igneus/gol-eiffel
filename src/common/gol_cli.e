class GOL_CLI

create {ANY}
   make

feature {}
   matrix: GOL_MATRIX

feature {ANY}
   make
      local
         args: ARGUMENTS_PROVIDER
         presenter: GOL_PRESENTER
      do
         create {MY_ARGUMENTS_PROVIDER} args

         if args.argument_count > 0 then
            load_matrix(args.argument(1))
         else
            create_default_matrix
         end

         create {CONSOLE_PRESENTER} presenter
         presenter.present(matrix)
      end

   -- load matrix from a file in the plaintext file format
   -- https://conwaylife.com/wiki/Plaintext
   load_matrix(path: STRING)
      local
         fr: INPUT_LINES_ITERATOR
         parsed: SIMPLE_MATRIX[BOOLEAN]
         live: BOOLEAN
         l, c: INTEGER
      do
         create {MY_SIMPLE_MATRIX[BOOLEAN]} parsed.make(1, 1)
         create {MY_INPUT_LINES_ITERATOR} fr.make(path)

         if fr.is_connected then
            l := 1
            from
               fr.read_line
            until
               fr.end_of_input
            loop
               if fr.last_string.item(1) = '!' then
                  -- comment, skip
               else
                  if l = 1 then
                     -- set width
                     parsed.resize(1, fr.last_string.count)
                  else
                     -- add line
                     parsed.resize(parsed.line_count + 1, parsed.column_count)
                  end

                  from
                     c := 1
                  until
                     c > fr.last_string.count or
                     c > parsed.column_count
                  loop
                     live := False
                     if fr.last_string.item(c) = 'O' then
                        live := True
                     end
                     parsed.put(live, l, c)

                     c := c + 1
                  end
                  l := l + 1
               end

               fr.read_line
            end
            fr.disconnect
         else
            io.put_string("Cannot read file %"" + path + "%".%N")
         end

         create {FINITE_GOL_MATRIX} matrix.make_from_simple_matrix(parsed)
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
