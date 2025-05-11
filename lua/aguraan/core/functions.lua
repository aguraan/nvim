-- Function to transform sequential await promises into parallel using Promise.all
local function transformAwaitToPromiseAll()
	-- local startLine = vim.fn.line("'<") -- Get the start line of the visual selection
	-- local endLine = vim.fn.line("'>") -- Get the end line of the visual selection
	local startLine = vim.fn.getpos("v")[2]
	local endLine
	for k, line in pairs(vim.fn.getcurpos()) do
		if k == 2 then
			endLine = line
		end
	end

	-- Concatinate the selected lines into a single string
	local selectedLines = vim.api.nvim_buf_get_lines(0, startLine - 1, endLine, false)
	local selectedText = table.concat(selectedLines, "\n")

	-- split the selected text by equal sign
	local lines = vim.split(selectedText, "=", { trimempty = true })

	local statements = {}
	for _, line in ipairs(lines) do
		-- split each line by "const"
		local trimmed = line:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
		local parts = vim.split(trimmed, "const", { trimempty = true })
		for _, part in ipairs(parts) do
			table.insert(statements, part)
		end
	end

	-- check if the statements are even length
	if #statements % 2 ~= 0 then
		print("Error: The number of statements is not even.")
		return
	end

	-- iterate over the statements by steps of 2
	local names = {}
	local promises = {}
	for i = 1, #statements, 2 do
		local varName = statements[i]:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
		-- Remove 'await' from the promise and replace ';' with ',' at the end
		local promise = statements[i + 1]:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
		promise = promise:gsub("await%s+", "") -- remove 'await'
		promise = promise:gsub(";", "") -- remove ';'

		table.insert(names, varName)
		table.insert(promises, promise)
	end

	if #names > 0 then
		-- Create the new Promise.all line with original variable names
		local promiseAllReplacement = {}
		table.insert(promiseAllReplacement, "const [" .. vim.fn.join(names, ", ") .. "] = await Promise.all([")
		for _, promise in ipairs(promises) do
			local promiseLines = vim.split(promise, "\n")
			for i, pLine in ipairs(promiseLines) do
				if i == #promiseLines then
					table.insert(promiseAllReplacement, pLine .. ",")
				else
					table.insert(promiseAllReplacement, pLine)
				end
			end
		end
		table.insert(promiseAllReplacement, "]);")

		-- Update the buffer with the new content
		vim.api.nvim_buf_set_lines(0, startLine - 1, endLine, false, promiseAllReplacement)
	else
		print("No sequential await promises found.")
	end
end

return {
	transformAwaitToPromiseAll = transformAwaitToPromiseAll,
}
