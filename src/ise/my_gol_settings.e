class MY_GOL_SETTINGS

inherit GOL_SETTINGS

create {ANY}
   make

feature {NONE}
   args: ARGUMENTS_PROVIDER

feature {ANY}
   make
      do
         create {MY_ARGUMENTS_PROVIDER} args
      end

   collect
      do
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
      require else
         has_input_file
      do
         Result := args.argument(1)
      end
end
