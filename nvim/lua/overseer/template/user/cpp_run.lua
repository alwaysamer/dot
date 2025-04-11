return {
    name = "Run",
    builder = function()
        return {
            cmd = { "./scripts/run.sh" },
            components = {
                { "on_output_quickfix", open_on_match = false },
                { "on_result_diagnostics", open_on_match = false },
                {
                    "default",
                    on_complete = function(task, status)
                        local code = task.result.code
                        if code == 0 then
                            vim.notify("✅ Run success!", vim.log.levels.INFO, { title = "Overseer" })
                        else
                            vim.notify("❌ Run failed!", vim.log.levels.ERROR, { title = "Overseer" })
                            vim.cmd("copen")
                        end
                    end,
                },
            },
        }
    end,
    condition = {
        filetype = { "cpp", "cmake" },
    },
}

