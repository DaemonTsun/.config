" Vim syntax file
" Language:    PROLOG
" Maintainer:  No one
" Last Change: 2018
" URL:         

if exists("b:current_syntax")
	finish
endif

" Prolog is case sensitive
syn case match

" Comment and TODO matching.
syn match	shebang /#!\(.\|\s\)*$/
syn region  prologCComment     fold start=/\/\*/ end=/\*\// contains=prologTODO,prologCommentParam,@Spell
syn region  prologDoxyComment     fold start=/\/\*\*/ end=/\*\// contains=prologTODO,prologDoxyBrief,prologDoxyParam,@Spell
syn match   prologComment      /%.*/ contains=prologTODO,@Spell
syn region  prologCommentFold  fold start=/^\zs\s*%/ skip=/^\s*%/ end=/^\ze\s*\([^%]\|$\)/ contains=prologComment
syn keyword prologTODO         FIXME TODO fixme todo Fixme FixMe Todo ToDo XXX xxx contained
syn cluster prologComments contains=prologCComment,prologComment,prologCommentFold,prologDoxyComment

syn match prologDoxyBrief /\* \\brief/ contained
syn match prologDoxyParam /\s*\* \\param\s*/ nextgroup=prologCommentParam contained

syn match prologCommentParam /\(+\|-\|?\)\<\w\+\>/ contained

" Prolog

syn match   prologNumber	/\<\d\+\>/					contained
syn match   prologNumber	/\<\d\+\.\d\+\>/			contained
syn match   prologAtom		/\<\l\w*\>\ze\([^(]\|$\)/	contained
syn match   prologVariable	/\<\(_\|\u\)\w*\>/			contained
syn match   prologChar		/\<\0'\(\\\)\?.\>/			contained

syn region  prologString       start=+"+ skip=+\\\\\|\\"+ end=+"+ contained
syn region  prologStringList   start=+`+ skip=+\\\\\|\\`+ end=+`+ contained
syn region  prologAtom         start=+'+ skip=+\\\\\|\\'+ end=+'+ contained

syn region  prologList         start=+\[+ end=+\]+ contains=prologListDelims,@prologVal,@prologComments contained
syn match   prologListDelims   /[,|]/ contained

syn region  prologTuple         start=+\W\zs(+ end=+)+ containedin=prologTuple,prologClauseParams contains=prologTuple,prologTupleDelims,@prologVal contained
syn match   prologTupleDelims   /,/ contained

syn match    prologStruct +[a-z]\w*+ nextgroup=prologStructContent contained 
syn region   prologStructContent start=+(+ end=+)+ contains=@prologVal contained
" syn region   prologClause   matchgroup=prologClauseHead start=+^\s*[a-z]\w*+ matchgroup=Normal end=+\.\s\|\.$+ contains=ALLBUT,prologClause

" syn match   prologPred /\<\l\w*\>/ contained
syn match   prologPredWithArgs /\<\l\w*\>/ nextgroup=prologPredArgs contained skipwhite
syn region  prologPredArgs start=+(+ end=+)+ contains=prologAnd,@prologVal contained skipwhite

" syn match   prologClauseHead /\<\l\w*\>/ nextgroup=prologClauseBody skipwhite
syn match	prologClauseHead2 /\<\l\w*\>/ nextgroup=prologClauseParams skipwhite

syn region	prologClauseParams start=+(+ end=+)+ contains=prologAnd,prologTuple,@prologVal nextgroup=prologClauseBody contained skipwhite

syn region  prologClauseBody start=+\(:-\|-->\|:\~\)+ end=+\.+ contains=prologClauseDelims,@prologBody,@prologOperator,@prologKeyword,@prologComments skipwhite

syn match   prologClauseDelims /\s*[,;]\s/ contained

syn match   prologAnd ',' contained

syn match   prologOperator "=\\=\|=:=\|\\==\|=<\|==\|>=\|\\=\|\\+\|<\|>\|=\|!\|try\|finally\|onError\|onFail"
syn match   prologAsIs     "===\|\\===\|<=\|=>"

syn match   prologCommentError      "\*/"

syn cluster prologVal contains=prologNumber,prologAtom,prologVariable,prologChar,prologString,prologStringList,prologList,prologStruct,prologTuple

syn cluster prologBody contains=@prologKeyword,prologNumber,prologVariable,prologStringList,prologPred,prologPredWithArgs,prologList,prologPredArgs,@prologComments

syn sync maxlines=50

" Keywords
syn keyword prologKeyword containedin=prologClauseBody var nonvar integer float number atom string 
	\ atomic compound unify_with_occurs_check fail false true repeat call once 
	\ catch throw abolish retract asserta assertz current_predicate clause open 
	\ close stream_property set_stream_position set_input set_output current_ouput 
	\ nl put_byte put_char put_code flush_output get_byte get_code get_char 
	\ peek_byte peek_code peek_char at_end_of_stream write_term write_canonical 
	\ write writeq read read_term functor arg copy_term atom_codes atom_chars 
	\ char_code number_chars number_codes atom_length sub_atom op current_op 
	\ char_conversion current_char_conversion is mod rem div round float 
	\ float_fractional_part float_integer_part truncate floor ceiling sqrt sin cos 
	\ atan log findall bagof setof sub_atom atom_string 
	\ rational callable ground cyclic_term subsumes subsumes_chk 
	\ unifiable use_module compare apply not ignore call_with_depth_limit 
	\ print_message print_message_lines message_hook on_signal current_signal exit 
	\ term_hash redefine_system_predicate retractall assert recorda recordz 
	\ erase flag compile_predicates index current_atom 
	\ current_blob current_functor current_flag current_key dwim_predicate 
	\ predicate_property open_null_stream current_stream is_stream 
	\ seek set_stream see tell append seeing telling seen set_prolog_IO told 
	\ wait_for_input byte_count character_count line_count line_position 
	\ put tab ttyflush get0 get skip get_single_char copy_stream_data print portra 
	\ read_history prompt setarg nb_setarg nb_linkarg duplicate_term numbervars 
	\ term_variables atom_number name term_to_atom atom_to_term atom_concat 
	\ concat_atom atom_prefix normalize_space collation_key char_type 
	\ code_type downcase_atom upcase_atom collation_key locale_sort string_to_atom 
	\ string_length string_concat sub_string between succ plus rdiv max min random 
	\ integer rationalize ceil xor tan asin acos pi e cputime eval msb lsb popcount
	\ powm arithmetic_function current_arithmetic_function is_list memberchk lengt 
	\ sort msort keysort predsort merge merge_set maplist forall writeln writef 
	\ swritef format format_predicate current_format_predicate tty_get_capability 
	\ tty_goto tty_put set_tty tty_size shell win_exec win_shell win_folder 
	\ win_registry_get_value getenv setenv unsetenv setlocale unix date time 
	\ get_time stamp_date_time date_time_stamp date_time_value format_time 
	\ parse_time window_title win_window_pos win_has_menu win_insert_menu 
	\ win_insert_menu_item access_file exists_file file_directory_name
	\ same_file exists_directory delete_file rename_file size_file time_file
	\ absolute_file_name is_absolute_file_name file_name_extension expand_file_name
	\ prolog_to_os_filename read_link tmp_file make_directory working_directory
	\ garbage_collect garbage_collect_atoms trim_stacks stack_parameter dwim_match
	\ wildcard_match sleep qcompile portray_clause acyclic_term clause_property
	\ setup_and_call_cleanup message_to_string phrase hash with_output_to
	\ read_pending_input prompt1 same_term sub_string merge_set
	\ call_cleanup chdir file_base_name stream_position_data fileerrors
	\ read_clause nth_clause recorded block halt current_prolog_flag 
	\ string_to_list atomic_list_concat string_lower string_upper 
	\ foldl string_codes last reverse list_to_set intersection is_set 
	\ member flatten length subtract exclude include module meta_predicate
    \ number_string skip_byte skip_string read_line_to_codes peek_string
    \ abs tcp_socket tcp_bind tcp_listen tcp_open_socket tcp_accept
    \ thread_create stream_pair thread_self thread_get_message thread_peek_message
    \ select setup_call_cleanup
" Keywords end

" The default highlighting.
hi def link shebang				Comment
hi def link prologComment       Comment
hi def link prologCComment      Comment
hi def link prologDoxyComment	Comment
hi def link prologDoxyBrief		Identifier
hi def link prologDoxyParam		Identifier
hi def link prologCommentParam	PreProc
hi def link prologCharCode      Special
hi def link prologTODO			TODO

hi def link prologKeyword       Keyword
hi def link prologClauseHead   	Special
hi def link prologClauseHead2	Special
hi def link prologClauseBody	Special
hi def link prologClauseDelims	Special

hi def link prologPred			Normal
hi def link prologPredArgs		Normal
hi def link prologQuestion      PreProc
hi def link prologSpecialCharacter Special
hi def link prologNumber        Number
hi def link prologAsIs          Normal
hi def link prologCommentError  Error
hi def link prologAtom          String
hi def link prologString        String
hi def link prologStringList    String
hi def link prologOperator      Operator
hi def link prologVariable		Type
hi def link prologStruct		Identifier

"endif


let b:current_syntax = "prolog"

" vim: ts=8
