# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/Users/rapy/Workspace/rails/flexmod"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/Users/rapy/Workspace/rails/flexmod/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/Users/rapy/Workspace/rails/flexmod/log/unicorn.log"
stdout_path "/Users/rapy/Workspace/rails/flexmod/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.flexmod.sock"
listen "/tmp/unicorn.myapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30