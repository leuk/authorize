module ArticlesHelper
	def push_articles(article)	
		@content = titlelize(article)
		@content << trunc_article(article)	
		@content << readmore(article)	
	end
	
	def trunc_article(article)
	    id = article.content.index('<!-- pagebreak -->') + 2
	    truncate(article.content , id)
	end
	
	def titlelize(article)
		content_tag :h2 do 
		  link_to article.title , article_path(article)
		end
	end
	def titlestrong(article)
		content_tag :strong do 
		  link_to article.title , article_path(article)
		end
	end
	def titlelink(article)
		  link_to article.title , article_path(article)
	end
	
	def readmore(article)
		link_to "Lire la suite - #{article.title}" , article_path(article) , 
				:class => 'readmore' , :id => 'readmore' 
	end
	
	def imglink(article)
		link_to image_tag(article.image.url(:original)) ,					        		article_url(article)
	end
	def randomspan (article , cycle)
		content_tag :span , :class => cycle do
			@content =  titlestrong(article)
			@content << '<br>'
			@content << truncate(article.content , 200)
			@content << readmore(article)
		end
	end
end
