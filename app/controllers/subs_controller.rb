class SubsController < ApplicationController
  #skinny controllers     actions
  #fat models     logic
  
  #               http verb
  # C create        POST
  # R read          GET
  # U update        PUT / PATCH
  # D destroy       DELETE
  #this is how the browser communicates with http verbs
  #crud actions are the things we can do in rails app

  # by default the controller actions return html
  #   correspond with view
  # XML, JSON 

# different actions(methods) typical to controllers
# good to have them than not, even if not in use
  # index
  #   # show all of the records from database
  #   # READ / GET
  #   def index
  #     @model_names = Model_name.all
  #   end

  # show
  #   # show a single record from database
  #   # must pass in ID to specify desired record
  #   # READ / GET
  #   def show
  #     @model_name = Model_name.find(params[:id])
  #   end
  # new
  #   # new form for a new record, creates a new record in memory
  #   # READ / GET
  #   def new
  #     @model_name = Model_name.new
  #   end
  # edit
  #   # edit for a record, update record in memory
  #   # pass in ID 
  #   # not until you click submit that it is saved in database
  #   def edit
  #     @model_name = Model_name.find(params[:id])
  #   end
  # create
  #   # post request
  #   # creates a record in database
  #   # Create / POST
  #   def create
  #     @model_name = Model_name.new(model_name_params)  
  #     if @model_name.save
  #       do soemthing or go somewhere
  #     else
  #       render :new
  #     end
  #   end

  #   .     # define
  #   .     # paramaters
  #   .     # here

  #   private
  #     def model_name_params
  #       params.require(:model_name).permit(:attr, :everythingtable has)
  #     end

  # update
  #   # update the record in your database
  #   # Update / PUT
  #   def update
  #     @model_name = Model_name.find(params[:id])
  #     if @model_name.update(model_name_params)
  #       do something or go somewhere
  #     else
  #       render :edit
  #     end
  #   end
  # destroy
  #   # delete the record from the database
  #   # pass in ID
  #   # destroy / DELETE
  #   def destroy
  #     @model_name = Model_name.find(params[:id])
  #     @model_name.destroy
  #     send somewhere # page currently on will be deleted and no longer exist

  #     or

  #     Model_name.find(params[:id]).destroy
  #     send somewhere

  #   end

  # destroy.all
  #   # deletes EVERYTHING
  #   # not recommended, permanent action


  # callback logic at a certain time
  # before_action
  # after_action
  # skip_before_action
  # before_action :method_name
  # before_action :method_name, only: [:show, :update, :edit, :destroy]
  # before_action :method_name, except: [:edit, :destroy]


  # GET
  def index
    @subs = Sub.all         #displays an array of all the subs
    # render index.html.erb
  end

  def show
    @sub = Sub.find(params[:id])
    # render show.html.erb
  end

  def new
    @sub = Sub.new
    render partial: 'form'
    # render new.html.erb
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'

  end

  def update    #look up a particular record and return the record
    @sub = Sub.find(param[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    # @sub = Sub.find(params[:id])
    # @sub.destroy
    # redirect_to subs_path

    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end

  private
   def sub_params
    # {sub: {name: 'puppies'}}
    params.required(:sub).permit(:name)
   end

end
