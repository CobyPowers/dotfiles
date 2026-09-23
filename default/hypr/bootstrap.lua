local reload_prefixes = {
  "default.hypr",
  "hypr",
}

local function should_reload_module(module)
  for _, prefix in ipairs(reload_prefixes) do
    if module == prefix or module:sub(1, #prefix + 1) == prefix .. "." then
      return true
    end
  end

  return false
end

local modules_to_reload = {}
for module in pairs(package.loaded) do
  if should_reload_module(module) then
    table.insert(modules_to_reload, module)
  end
end

for _, module in ipairs(modules_to_reload) do
  package.loaded[module] = nil
end

local home = os.getenv("HOME")
package.path = home
  .. "/.local/share/dotfiles/?.lua;"
  .. home
  .. "/.config/?.lua;"
  .. package.path
