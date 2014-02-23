@dir = File.dirname(__FILE__)

working_directory @dir

timeout 30

pid "#{@dir}/var/unicorn.pid"
stderr_path "#{@dir}/var/log/unicorn.stderr.log"
stdout_path "#{@dir}/var/log/unicorn.stdout.log"

GC.respond_to?(:copy_on_write_friendly=) and
GC.copy_on_write_friendly = true

before_fork do |server, worker|
   old_pid = "#{server.config[:pid]}.oldbin"
   if old_pid != server.pid
      begin
         sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
         Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
      end
   end
end
