OUTFILES=fake_exporter_uwsgi.ini fake_exporter.yml

all: $(OUTFILES)

clean:
	-rm $(OUTFILES)

%.ini: %.ini.j2
	python -c 'import jinja2; import sys; print jinja2.Template(open(sys.argv[1]).read()).render()' $^ > $@

%.yml: %.yml.j2
	python -c 'import jinja2; import sys; print jinja2.Template(open(sys.argv[1]).read()).render()' $^ > $@

run_uwsgi:
	uwsgi --ini fake_exporter_uwsgi.ini

deps-deb:
	apt-get install -y uwsgi uwsgi-plugin-python python-flask python-jinja2

.PHONY: run_uwsgi deps-deb
