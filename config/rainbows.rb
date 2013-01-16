worker_processes 4
timeout 30

Rainbows! do
	worker_connections 400
	keepalive_timeout 0
	use :EventMachine
end