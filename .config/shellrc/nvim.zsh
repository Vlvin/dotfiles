function print_osc7() {
  printf '\033]7;file://%s\033\\' "$PWD"
}
# PROMPT_COMMAND='print_osc7'
function cd {
  builtin cd $@
  printf '\033]7;file://%s\033\\' "$PWD"
}
