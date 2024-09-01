return {
    {
        "andweeb/presence.nvim",
        config = function ()
            require("presence").setup({
                -- General options
                auto_update         = true,
                neovim_image_text   = "neovim?",
                main_image          = "file",
                client_id           = "793271441293967371",
                log_level           = nil,
                debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
                enable_line_number  = true,                      -- Displays the current line number instead of the current project
                blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
                buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
                file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
                show_time           = true,                       -- Show the timer

                -- Rich Presence text options
                editing_text        = function (filename)
                    local name = filename:match("^.+/(.+)$") or filename
                    local base, ext = name:match("^(.-)(%.[^.]+)$")
                    base = base or name
                    ext = ext or ""
                    local visible_length = math.ceil(#base / 2)
                    local new_name = base:sub(1, visible_length) .. string.rep("*", #base - visible_length) .. ext
                    return "Editing " .. new_name
                end,
                file_explorer_text  = "Browsing %s",
                git_commit_text     = "Committing changes",
                plugin_manager_text = "Managing plugins",
                reading_text        = "Reading ***",
                workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
            })
        end
    }
}
