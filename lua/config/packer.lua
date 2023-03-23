require'packer'.init({
  display = {
    prompt_border = 'single'
  },
  max_jobs = 20,
  git = {
    clone_timeout = 3600,
  }
})
