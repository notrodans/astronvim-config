local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then return end
astronvim.lspkind = astronvim.user_plugin_opts("plugins.lspkind", {
  mode = "symbol_text",
  before = function(entry, vim_item)
    vim_item.menu = entry.completion_item.detail
    return vim_item
  end,
  symbol_map = {
    NONE = "",
    Array = "",
    Boolean = "⊨",
    Class = "",
    Constructor = "",
    Key = "",
    Namespace = "",
    Null = "NULL",
    Number = "#",
    Object = "⦿",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "𝓐",
    TypeParameter = "",
    Unit = "",
  },
})
lspkind.init(astronvim.lspkind)
