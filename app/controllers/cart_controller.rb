class CartController < ApplicationController

  def show
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def add_item
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @product = Product.find(params[:product_id])
    unless @line_item = @cart.line_items.find_by_product_id(@product.id)
      @line_item = @cart.line_items.build(product: @product, quantity: 1)
    else
      @line_item.quantity += 1
    end
    if @line_item.save
      flash[:notice] = "#{@product.name} added to cart"
      redirect_to root_path
    end
  end

  def remove_item
    @cart = Cart.find(session[:cart_id])
    @line_item = @cart.line_items.find(params[:line_item_id])
    if @line_item.destroy
      flash[:notice] = "#{@line_item.product.name} removed from cart"
      redirect_to cart_path
    end
  end

  def checkout
    @cart = Cart.find(session[:cart_id])
    @order = Order.create
    @cart.line_items.each do |line_item|
      @order.line_items << LineItem.new({product: line_item.product, quantity: line_item.quantity})
    end
    @order.save
    if @order.bill
      session[:cart_id] = nil
      @cart.destroy
      flash[:notice] = "Thank you for completing your order"
      redirect_to root_path
    end
  end

  def thank_you
  end



end

