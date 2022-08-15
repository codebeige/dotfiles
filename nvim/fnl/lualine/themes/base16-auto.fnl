(module lualine.themes.base16-auto
  {autoload {loader lualine.utils.loader}})

(defn- theme-name []
  (string.gsub vim.g.colors_name "^base16%-" ""))

(let [(ok theme) (pcall loader.load_theme (theme-name))]
  (when (and ok theme) (lua "return theme")))

(def- colors
 {:bg       vim.g.base16_gui01
  :alt_bg   vim.g.base16_gui02
  :dark_fg  vim.g.base16_gui03
  :fg       vim.g.base16_gui04
  :light_fg vim.g.base16_gui05
  :normal   vim.g.base16_gui0D
  :insert   vim.g.base16_gui0B
  :visual   vim.g.base16_gui0E
  :replace  vim.g.base16_gui09})

(def normal  {:a {:fg colors.bg :bg colors.normal}
              :b {:fg colors.light_fg :bg colors.alt_bg}
              :c {:fg colors.fg :bg colors.bg}})

(def command normal)

(def replace {:a {:fg colors.bg :bg colors.replace}
              :b {:fg colors.light_fg :bg colors.alt_bg}})

(def insert {:a {:fg colors.bg :bg colors.insert}
             :b {:fg colors.light_fg :bg colors.alt_bg}})

(def terminal insert)

(def visual {:a {:fg colors.bg :bg colors.visual}
             :b {:fg colors.light_fg :bg colors.alt_bg}})

(def inactive {:a {:fg colors.dark_fg :bg colors.bg}
               :b {:fg colors.dark_fg :bg colors.bg}
               :c {:fg colors.dark_fg :bg colors.bg}})
