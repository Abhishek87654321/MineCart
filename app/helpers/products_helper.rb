module ProductsHelper
    def show_link(product, action_name)
        if policy(product).edit?
        link_to "edit product" , edit_product_path(product.id)
        end

        unless action_name == "show"
        link_to "show product" , product_path(product.id)
        end
        if policy(product).add_item?
            link_to "Add to Cart", add_to_cart_product_path(product), method: :post
        end  
    end
end
