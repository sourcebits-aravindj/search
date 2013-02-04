

class WebsController < ApplicationController
  # GET /webs
  # GET /webs.json
  def index
      @web = Web.new
  end


  # GET /webs/1
  # GET /webs/1.json
  def show
    @web = Web.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @web }
    end
  end

  # GET /webs/new
  # GET /webs/new.json
  def new
    @web= Web.new
  end

  # GET /webs/1/edit
  def edit
    @web = Web.find(params[:id])
  end
  def mymethod
    @web= Web.new
  end
  # POST /webs
  # POST /webs.json
  def create
    
    #@word= params[:web][:word]
    @result=[]
    word=params[:web][:word]
    word=word.split(' ')
    i=0
    word.each do |x|
      #p x
      @web=Web.find_by_sql("select id from webs where word= '#{x}'")
      #@web=Web.where("word=?",params[:web][:word])
      #@result= Container.joins('INNER JOIN WebContainer on Container.id=Webcontainer.container_id')
      #@result= Container.webcontainer.find_by_word_id(17);
      st=Container.all(:joins => :webcontainers,:conditions => {:webcontainers => {:web_id => @web}}, :order => "webcontainers.weight desc")
      int=st&@result
      difa=@result-st
      difb=st-@result
      @result=int+difa+difb 
    end
    cr=0
    @newresult=[]
    @result.each do |y|
      y=y.title
      y=y.split(' ')
      i=0
      word.each do |z|
        if(y[i].match(/^#{z}$/i)!=nil)
          i=i+1
        else
          break
        end
      end
      if(i==word.count)
        @newresult.push(@result[cr])
      end
      cr=cr+1
    end
    tempar=@result-@newresult
    @newresult=@newresult+tempar
    @result=@newresult
    @web=Web.new
    @showw=params[:web][:word]
    puts @showw
    puts @showw.class
  end

  # PUT /webs/1
  # PUT /webs/1.json
  def update
    @web = Web.find(params[:id])

    respond_to do |format|
      if @web.update_attributes(params[:web])
        format.html { redirect_to @web, notice: 'Web was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @web.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webs/1
  # DELETE /webs/1.json
  def destroy
    @web = Web.find(params[:id])
    @web.destroy

    respond_to do |format|
      format.html { redirect_to webs_url }
      format.json { head :no_content }
    end
  end
end
