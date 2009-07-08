class ArticlesController < ApplicationController
  
  filter_access_to :all	
	
	
 uses_tiny_mce :only => ['new' , 'edit'] , :options => 
		   				{
		   				  :mode => 'textareas',
		                  :theme => 'advanced',		                  
		                  :plugins => %w{ table fullscreen pagebreak style layer},
		                  :theme_advanced_resizing => true,
		                  :theme_advanced_buttons1 => %w{save newdocument   bold italic underline strikethrough   justifyleft justifycenter justifyright justifyfull   styleselect formatselect fontselect,fontsizeselect},
:theme_advanced_buttons2 => %w{cut copy paste pastetext pasteword search replace bullist numlist  outdent indent blockquote undo redo link unlink anchor image cleanup help code insertdate inserttime preview forecolor backcolor insertlayer moveforward movebackward absolute styleprops},
:theme_advanced_buttons3 => %w{tablecontrols hr removeformat visualaid sub sup  charmap emotions iespell media advhr print ltr rtl fullscreen pagebreak  insertimage spellchecker cite abbr acronym del ins attribs visualchars nonbreaking template blockquote},
		                  :theme_advanced_resize_horizontal => true,
		                  :theme_advanced_toolbar_location => "top",
		                  :theme_advanced_toolbar_align => "left"
		                }
  before_filter :load_sections , :only => [:new , :edit]
	
  def index
    @articles = Article.all 
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      redirect_to :action => 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to @article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
  
  private
  	def load_sections
  		@sections = Section.all :order => 'title'
  	end
end
