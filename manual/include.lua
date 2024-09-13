-- Lua filter to include Markdown files at a specific location
function RawBlock(el)
  
  -- Look for the placeholder that matches the include statement
  if el.text == "<!-- include references/myreference.md -->" then
    
    -- Open and read the content of the embed.md file
    local f = io.open("references/myreference.md", "r")
    if not f then
      -- If the file is not found, raise an error
      io.stderr:write("Error: Could not open references/myreference.md\n")
      os.exit(1)
    end
    local content = f:read("*all")
    
    f:close()
    -- Convert the content from markdown to pandoc AST (Abstract Syntax Tree)
    local parsed_content = pandoc.read(content, "markdown").block
    -- Return the content as a raw Markdown block
    return parsed_content
  else
    print("Dont Find the include directive for references/embed.md")
  end
end
