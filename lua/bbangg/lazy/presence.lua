return {
    {
        "andweeb/presence.nvim",
        config = function ()
            require("presence").setup({
                -- General options
                auto_update         = true,
                neovim_image_text   = "neovim",
                main_image          = "file",
                client_id           = "793271441293967371",
                log_level           = nil,
                debounce_timeout    = 10,
                enable_line_number  = true,
                blacklist           = {},
                buttons             = true,
                file_assets         = {},
                show_time           = true,

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
                workspace_text      = "Working on %s",
                line_number_text    = "Line %s out of %s",
            })
        end
    }
}
