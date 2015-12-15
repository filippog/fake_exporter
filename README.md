fake exporter for Prometheus
============================

The primary use case for `fake_exporter` is to evaluate prometheus in a
synthetic environment. To do so a Flask application is provided that
will export a `/metrics` endpoint for Prometheus to scrape.

Usage
=====

To run a single instance of `fake_exporter` install Flask and run
`./fake_exporter.py`. The metrics will be available with e.g. `curl -s
http://localhost:5000/metrics`.

The endpoint accepts some arguments, notably `metrics` and `seed`
respectively to fix the number of metrics returned and the random seed
if needed.

Simulating targets
=======================

To simulate many targets in an easy way, it is possible to run
`fake_exporter` with any WSGI compatible application server, a sample
configuration for uwsgi is provided that binds multiple ports on
`localhost`. Generate it with `make` (you'll need `jinja2` installed).

Once `fake_exporter.py` is available on multiple ports, Prometheus
should be instructed about the targets. A sample configuration is
provided in `prometheus.yml` with the respective targets file in
`fake_exporter.yml`. Note that if the latter file is modified
Prometheus will pick up the changes automatically.
