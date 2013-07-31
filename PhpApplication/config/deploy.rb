#set :application, "PhpApplication"
#set :repository,  "/Users/erkoc/Desktop/phpapp"
# set :user, 'shh_username'
# set :scm, :git
#set :deploy_to, "/Library/WebServer/Documents/PhpApplication"

#set :deploy_via, :remote_cache
#set :use_sudo, false
#set :copy_exclude, [".git", ".DS_Store", ".gitignore", ".gitmodules", "Capfile", "config/deploy.rb"]

#server "localhost", :app

set :application, "PhpApplication"

set :domain,"localhost"
server domain, :web, :app

default_run_options[:pty]= true
set :use_sudo, false
set :copy_cache, true

set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

set :scm, :git
set :user, 'erkoc'
set :deploy_to, "/Users/erkoc/Desktop/htdocs/PhpApplication"
set :repository, "git@github.com:sly01/PhpApplication.git"

#role :web, "localhost"                          # Your HTTP #server, Apache/etc
#role :app, "localhost"                          # This may be the #same as your `Web` server
#role :db,  "localhost", :primary => true # This is where #Rails migrations will run

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
