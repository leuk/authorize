namespace :blogify	do
	desc "Synchronize plugin extra files with the main app"
	task :sync	do
		system "rsync -ruv vendor/plugins/blogify/db/migrate db"
    	system "rsync -ruv vendor/plugins/blogify/public ."
	end
end
