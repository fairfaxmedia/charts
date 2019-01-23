UPSTREAM_GIT_URL = https://github.com/fairfaxmedia/charts.git
CHARTS_URL = https://charts.ffx.io
COMMIT = $(shell git rev-parse --short HEAD)

.PHONY: clean build publish

clean:
	rm -rf dist-repo

dist-repo: clean
	git clone --quiet --single-branch -b gh-pages "${UPSTREAM_GIT_URL}" dist-repo

# Build all Helm packages into dist-repo and regenerate the chart index
build: dist-repo
	cd package && \
		docker-compose build && \
		docker-compose run --rm package package.sh "${CHARTS_URL}" dist-repo && \
		cd ../dist-repo && \
		echo "--- Diff" && \
		git diff --stat

# Commit and push the chart index
release: build
	cd dist-repo && \
		git add *.tgz index.yaml && \
		git commit --message "Update to fairfaxmedia/charts@${COMMIT}" && \
		git pull --rebase && \
		git push origin gh-pages
