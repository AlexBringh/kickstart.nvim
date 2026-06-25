if vim.b.current_syntax then
  return
end

vim.cmd([[
  syn case match

  " Keywords
  syn keyword fbsKeyword namespace table struct enum union root_type include attribute rpc_service
  
  " Types
  syn keyword fbsType bool byte ubyte short ushort int uint long ulong float double int8 uint8 int16 uint16 int32 uint32 int64 uint64 float32 float64 string

  " User-defined Types and Namespaces (using lookbehinds to avoid consuming keywords)
  syn match fbsUserType "\(\<\(table\|struct\|enum\|union\|root_type\)\>\s\+\)\@<=\w\+"
  syn match fbsUserType "\(:\s*\[\?\s*\)\@<=\w\+"
  syn match fbsNamespaceName "\(\<namespace\>\s\+\)\@<=[a-zA-Z0-9_.:]\+"

  " Booleans
  syn keyword fbsBoolean true false

  " Numbers
  syn match fbsNumber "\<\d\+\>"
  syn match fbsFloat "\<\d\+\.\d\+\>"

  " Strings
  syn region fbsString start=/"/ skip=/\\"/ end=/"/
  syn region fbsString start=/'/ skip=/\\'/ end=/'/

  " Comments
  syn match fbsComment "//.*$"
  syn region fbsBlockComment start="/\*" end="\*/"

  " Link to standard highlight groups
  hi def link fbsKeyword Keyword
  hi def link fbsType Type
  hi def link fbsUserType Structure
  hi def link fbsNamespaceName Include
  hi def link fbsBoolean Boolean
  hi def link fbsNumber Number
  hi def link fbsFloat Float
  hi def link fbsString String
  hi def link fbsComment Comment
  hi def link fbsBlockComment Comment
]])

vim.b.current_syntax = "fbs"
