module Spree
  module Admin
    class MenusController < ResourceController

      def create
        @menu = Spree::Menu.create(menus_params)
        redirect_to(:action => :index)
      end

      def index
        @menus = Spree::Menu.only_parent
      end
      
      def show
        redirect_to(:action => :edit)
      end

      def update_positions
        params[:positions].each do |id, index|
          Spree::Menu.update_all(['position=?', index], ['id=?', id])
        end

        respond_to do |format|
          format.html { redirect_to admin_menus_url() }
          format.js  { render :text => 'Ok' }
        end
      end

      private
      def menus_params
        params.require(:menu).permit(:presentation, :url, :parent, :position, :visible, :name, :linkable, :parent_id,
                                      :linkable_id, :linkable_type, :category, :class_list)
      end

    end
  end
end

