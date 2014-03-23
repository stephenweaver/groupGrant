Deface::Override.new(:virtual_path => "spree/shared/_header",
                     :name         => "remove_logo",
                     :remove       => "figure#logo")

Deface::Override.new(:virtual_path => "spree/shared/_footer",
                     :name         => "remove_logo",
                     :remove       => "div#footer-left")

Deface::Override.new(:virtual_path  => "spree/layouts/spree_application",
                     :insert_before => "div.container",
                     :name          => "registration_future",
                     :partial       => "layouts/nav_bar")

Deface::Override.new(:virtual_path  => "spree/layouts/spree_application",
                     :replace       => "nav#op-nav-bar",
                     :name          => "right_search_bar",
                     :partial       => "spree/shared/nav_bar")

Deface::Override.new(:virtual_path  => "spree/layouts/spree_application",
                     :replace       => "nav#op-nav-bar",
                     :name          => "bootstrapify_search",
                     :partial       => "spree/shared/search")

Deface::Override.new(:virtual_path  => "spree/layouts/spree_application",
                     :replace       => "nav#op-nav-bar",
                     :name          => "bootstrapify_search",
                     :partial       => "spree/shared/search")

Deface::Override.new(:virtual_path     => "spree/products/_cart_form",
                     :replace_contents => "div.add-to-cart",
                     :name             => "bootstrapify_add_to_cart",
                     :partial          => "spree/products/edit_add_to_cart")

Deface::Override.new(:virtual_path     => "spree/checkout/_delivery",
                     :replace_contents => "div.form-buttons",
                     :name             => "bootstrapify_edit_checkout_button",
                     :partial          => "spree/checkout/edit_delivery")