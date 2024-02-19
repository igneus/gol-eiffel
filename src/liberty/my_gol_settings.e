class MY_GOL_SETTINGS

inherit GOL_SETTINGS

create {ANY}
   make

feature {}
   args: ARGUMENTS_PROVIDER

feature {ANY}
   make
      do
         create {MY_ARGUMENTS_PROVIDER} args
      end

   collect
      do
         if args.argument_count > 0 then
            input_file := args.argument(1)
         end
      end

   is_valid: BOOLEAN
      do
         Result := True
      end

   has_input_file: BOOLEAN
      do
         Result := args.argument_count > 0
      end

   input_file: STRING
end
