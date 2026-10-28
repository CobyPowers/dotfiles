for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		default = i == 1,
		persistent = true,
	})
end
