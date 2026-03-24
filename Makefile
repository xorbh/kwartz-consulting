SHELL := /bin/bash
RBENV := eval "$$(rbenv init -)" &&

.PHONY: serve install stop pdf

install:
	$(RBENV) bundle install

serve: stop
	@echo "Site will be at: http://localhost:4444/"
	$(RBENV) bundle exec jekyll serve --livereload --livereload-port 44440 --baseurl ""

stop:
	-lsof -ti:4444 -ti:44440 | xargs kill 2>/dev/null || true

pdf:
	pandoc _posts/2026-03-24-outcomes-over-activity-leadership-in-the-agentic-era.md \
		-o _posts/2026-03-24-outcomes-over-activity-leadership-in-the-agentic-era.pdf \
		--pdf-engine=pdflatex \
		-V geometry:margin=1in \
		-V fontsize=11pt \
		--metadata title="Outcomes Over Activity"
