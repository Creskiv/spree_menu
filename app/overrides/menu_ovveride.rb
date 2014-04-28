Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "menu_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:menus) %>",
                     :disabled => false)
