let g:tagbar_type_groovy = {
		\ 'ctagstype' : 'c++',
		\ 'kinds'     : [
				\ 'd:macros:1:0',
				\ 'p:prototypes:1:0',
				\ 'g:enums',
				\ 'e:enumerators:0:0',
				\ 't:typedefs:0:0',
				\ 'n:namespaces',
				\ 'c:classes',
				\ 's:structs',
				\ 'u:unions',
				\ 'f:functions',
				\ 'm:members:0:0',
				\ 'v:variables:0:0'
		\ ],
		\ 'sro'        : '::',
		\ 'kind2scope' : {
				\ 'g' : 'enum',
				\ 'n' : 'namespace',
				\ 'c' : 'class',
				\ 's' : 'struct',
				\ 'u' : 'union'
		\ },
		\ 'scope2kind' : {
				\ 'enum'      : 'g',
				\ 'namespace' : 'n',
				\ 'class'     : 'c',
				\ 'struct'    : 's',
				\ 'union'     : 'u'
		\ }
\ }

