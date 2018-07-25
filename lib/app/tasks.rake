# frozen_string_literal: true

namespace :server do
  desc 'Start thin server'
  task :start do
    exec 'thin -s 2 -C config/thin_config.yml -R config.ru start'
  end

  desc 'Stop application server'
  task :stop do
    folder = 'tmp/pids/*'

    pids = []

    Dir[folder].each do |file|
      File.open(File.expand_path(file), 'r').tap do |f|
        pids[pids.size] = f.read.to_i
      end
    end

    pids.each do |pid|
      Process.kill('SIGTERM', pid)
    end
  end

  desc 'Restart server'
  task :restart do
    Rake::Task['server:stop'].invoke
    Rake::Task['server:start'].invoke
  end
end

desc 'Fire irb console'
task :console do
  require './config/boot.rb'
  require 'irb'
  ARGV.clear
  IRB.start
end

task c: :console

namespace :db do
  desc 'Drop && Create && Migrate the DB'
  task :recreate do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end
end
