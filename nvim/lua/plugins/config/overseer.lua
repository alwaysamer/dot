return {
  'stevearc/overseer.nvim',
  opts = {
      templates = { "user.cpp_build", "user.cpp_clean", "user.cpp_run"}
  },
  keys = {
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer Run" },
  }
}
