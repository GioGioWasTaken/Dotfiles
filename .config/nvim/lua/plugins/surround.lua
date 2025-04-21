local surround = require("nvim-surround")

surround.setup({
    surrounds = {
        ["l"] = {
            add = function()
                local clipboard = vim.fn.getreg("+"):gsub("^[%s\n]*(.-)[%s\n]*$", "%1")
                if clipboard:find("\n") then
                    vim.notify("URL must not contain newline characters", vim.log.levels.WARN)
                else
                    return {
                        { "[" },
                        { "](" .. clipboard .. ")" },
                    }
                end
            end,
            find = "%b[]%b()",
            delete = "^(%[)().-(%]%b())()$",
            change = {
                target = "^()()%b[]%((.-)()%)$",
                replacement = function()
                    local clipboard = vim.fn.getreg("+"):gsub("^[%s\n]*(.-)[%s\n]*$", "%1")
                    if clipboard:find("\n") then
                        vim.notify("URL must not contain newline characters", vim.log.levels.WARN)
                    else
                        return {
                            { "" },
                            { clipboard },
                        }
                    end
                end,
            },
        },
        ["~"] = {
            add = function()
                local result = require("nvim-surround.config").get_input("Markdown code block language: ")
                return {
                    { "```" .. result, "" },
                    { "", "```" },
                }
            end,
        },
        ["k"] = {
            add = function()
                return {
                    { "[[" },
                    { "]]" },
                }
            end,
        },
        ["c"] = {
            add = function()
                local cmd = require("nvim-surround.config").get_input("Command: ")
                return { { "\\" .. cmd .. "{" }, { "}" } }
            end,
        },
        ["e"] = {
            add = function()
                local env = require("nvim-surround.config").get_input("Environment: ")
                return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
            end,
        },
        ["P"] = {
            add = function()
                local lang = require("nvim-surround.config").get_input("Language: ")
                lang = lang:lower()
                if lang == "java" then
                    return { { "System.out.println(" }, { ");" } }
                elseif lang == "c" then
                    return { { 'printf("%s",' }, { ");" } }
                elseif lang == "py" then
                    return { { "print(" }, { ")" } }
                elseif lang == "rust" then
                    return { { 'println!("{},' }, { ");" } }
                elseif lang == "c#" then
                    return { { "Console.WriteLine(" }, { ");" } }
                elseif lang == "cpp" then
                    return { { "std::cout <<" }, { "<< std::endl;" } }
                else
                    return { { "" }, { "" } }
                end
            end,
        },
    },
})
