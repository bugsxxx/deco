class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token
  skip_filter :verify_signed_out_user


  # GET /products
  # GET /products.json
  def index

    /# @products = Product.all
    respond_with(@products) do |format|
      format.json { render :json => @products.as_json }
      format.html
    end
   /#
    
    @prods= Product.all


    respond_to do |format|
       if params[:query]
       
        @prods = Product.search(params[:query])
        
        format.html { @products = Product.search(params[:query]) }
        format.json { render :json => @prods }  #@products = Product.search(params[:query]) 
      else
         @prods = Product.all
        #@products = Product.all
        format.html { @products = Product.all }
        format.json { render :json => @prods }
      end
    end

   end

  # GET /products/1
  # GET /products/1.json
  def show
    render :json => {:data => @product }
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search

    
       if params[:query]
       
        @prods = Product.search(params[:query])
        
        #format.html { @products = Product.search(params[:query]) }
        #format.json { render :json => @prods }  #@products = Product.search(params[:query]) 

        render  :json =>  {
                          :data => @prods
                          
                          


                }  
      else
         @prods = Product.all
        #@products = Product.all
        #format.html { @products = Product.all }
        render :json => {:data => @prods }
      end
   



    
  end



 




  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :cor, :descr)
    end
end
