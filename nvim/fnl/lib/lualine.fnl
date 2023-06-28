(module lib.lualine
  {autoload {loader lualine.utils.loader}})

(defn- theme-name []
  (case vim.g.colors_name
    nil "auto"
    theme (string.gsub vim.g.colors_name "^base16%-" "")))

(defn- make-theme []
  (let [bg       (.. :# vim.g.base16_gui01)
        alt_bg   (.. :# vim.g.base16_gui02)
        dark_fg  (.. :# vim.g.base16_gui03)
        fg       (.. :# vim.g.base16_gui04)
        light_fg (.. :# vim.g.base16_gui05)
        normal   (.. :# vim.g.base16_gui0D)
        insert   (.. :# vim.g.base16_gui0B)
        visual   (.. :# vim.g.base16_gui0E)
        replace  (.. :# vim.g.base16_gui09)]
    {:normal   {:a {:fg bg :bg normal}
                :b {:fg light_fg :bg alt_bg}
                :c {:fg fg :bg bg}}
     :command  {:a {:fg bg :bg normal}
                :b {:fg light_fg :bg alt_bg}
                :c {:fg fg :bg bg}}
     :replace  {:a {:fg bg :bg replace}
                :b {:fg light_fg :bg alt_bg}}
     :insert   {:a {:fg bg :bg insert}
                :b {:fg light_fg :bg alt_bg}}
     :terminal {:a {:fg bg :bg insert}
                :b {:fg light_fg :bg alt_bg}}
     :visual   {:a {:fg bg :bg insert}
                :b {:fg light_fg :bg alt_bg}}
     :inactive {:a {:fg dark_fg :bg bg}
                :b {:fg dark_fg :bg bg}
                :c {:fg dark_fg :bg bg}}}))

(defn get-theme []
  (case (pcall loader.load_theme (theme-name))
    (true theme) theme
    _ (make-theme)))
